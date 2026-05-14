ah-init () {
	echo "==> you need to eliminate the .bat .cmd .ps1 .vbs here"
	find ~ -name "*.ps1" -print0
	find ~ -name "*.bat" -print0
	find ~ -name "*.cmd" -print0
	find ~ -name "*.vbs" -print0
	echo "you need to execute rm *recived name*, if it needs sudo, add a sudo after the command"
}

ah-superboot () {
	sudo pacman -Syu
	reboot
}

ah-help () {
	echo "ah-superboot: this update your system and reboot"
	echo "ah-init: this tell you the malware files (an examle .bat)"
	echo "tip: don`t run anythink as name is run me!.bat"
}
