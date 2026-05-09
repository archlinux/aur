ah-init () {
	echo "==> you need to eliminate the .bat .cmd .ps1 .vbs here"
	find ~ -name "*.ps1" -print0 | xargs -0 rm -f
	find ~ -name "*.bat" -print0 | xargs -0 rm -f
	find ~ -name "*.cmd" -print0 | xargs -0 rm -f
	find ~ -name "*.vbs" -print0 | xargs -0 rm -f
	echo "you need to execute rm *recived name*, if it needs sudo, add a sudo after the command"
}

ah-superboot () {
	sudo pacman -Syu
	reboot
}

ah-help () {
	echo "ah-superboot: this update your system and reboot"
	echo "ah-init: this eliminate all the malware files (an examle .bat)"
}
