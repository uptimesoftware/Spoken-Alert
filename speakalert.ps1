Param(
	[string]$computer,
	[string]$gender,
	[string]$rate,
	[string]$texttospeak
)
$Error.Clear()

$Username = 'domain\username'
$Password = 'password'
$pass = ConvertTo-SecureString -AsPlainText $Password -Force
$Cred = New-Object System.Management.Automation.PSCredential -ArgumentList $Username,$pass

icm -cn $computer -credential $Cred {
Param( 
	[string]$gender,
	[string]$texttospeak,
	[string]$rate
)
$Error.Clear()
Add-Type -AssemblyName System.speech
$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
$speak.SelectVoiceByHints($gender)
$speak.Rate = $rate
$speak.Speak($texttospeak)
} -ArgumentList $gender, $texttospeak, $rate
