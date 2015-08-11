# Author: Stefan Majewsky <majewsky at-the-server gmx with-the-tld net>

pkgname=asus-kbd-backlight
pkgver=1.1
pkgrel=1
pkgdesc="Helper for adjusting keyboard backlight brightness in Asus Zenbook UX31A and similar models"
url="https://wiki.archlinux.org/index.php/ASUS_Zenbook_Prime_UX31A#keyboard_backlight_script"
arch=('any')
license=(FDL1.3)
depends=('bash')
optdepends=('systemd: automatically grant user access to keyboard backlight control')
install="asus-kbd-backlight.install"

# general note: this package contains only two files; I don't see any added
# value in stuffing these into a tarball when I can also place them in here
# using heredocs (cf. http://stackoverflow.com/a/2954835/334761 for reference)
build() {
	mkdir -p $srcdir/$pkgname-$pkgver/
	cd $srcdir/$pkgname-$pkgver/
	# write the backlight helper script
	cat <<-'EOF' > ./asus-kbd-backlight
		#!/bin/bash
		
		path="/sys/class/leds/asus::kbd_backlight"
		if [ ! -e "$path" ]; then
		  path="/sys/devices/platform/asus-nb-wmi/leds/asus::kbd_backlight"
		fi
		
		# max should be 3
		max=$(cat ${path}/max_brightness)
		# step: represent the difference between previous and next brightness
		step=1
		previous=$(cat ${path}/brightness)
		
		function commit {
			if [[ $1 = [0-9]* ]]
			then 
				if [[ $1 -gt $max ]]
				then 
					next=$max
				elif [[ $1 -lt 0 ]]
				then 
					next=0
				else 
					next=$1
				fi
				echo $next >> ${path}/brightness
				exit 0
			else 
				exit 1
			fi
		}
		
		case "$1" in
		 up)
		     commit $(($previous + $step))
		  ;;
		 down)
		     commit $(($previous - $step))
		  ;;
		 max)
			 commit $max
		  ;;
		 on)
			 $0 max
		  ;;
		 off)
			 commit 0
		  ;;
		 show)
			 echo $previous
		  ;;
		 night)
			 commit 1 
			 ;;
		 allowusers)
			 # Allow members of users group to change brightness
			 sudo chgrp users ${path}/brightness
			 sudo chmod g+w ${path}/brightness
		  ;;
		 disallowusers)
			 # Allow members of users group to change brightness
			 sudo chgrp root ${path}/brightness
			 sudo chmod g-w ${path}/brightness
		  ;;
		 *)
			 commit	$1
		esac
		
		exit 0
	EOF
	# write the systemd unit file
	cat <<-'EOF' > ./asus-kbd-backlight.service
		[Unit]
		Description=Allow user access to keyboard backlight
		After=systemd-udevd.service
		
		[Service]
		Type=oneshot
		RemainAfterExit=yes
		ExecStart=/usr/bin/asus-kbd-backlight allowusers
		ExecStop=/usr/bin/asus-kbd-backlight disallowusers
		
		[Install]
		WantedBy=multi-user.target
	EOF
}

package() {
	cd $srcdir/$pkgname-$pkgver/
	install -D -m 0755 asus-kbd-backlight "$pkgdir/usr/bin/asus-kbd-backlight"
	install -D -m 0644 asus-kbd-backlight.service "$pkgdir/usr/lib/systemd/system/asus-kbd-backlight.service"
}
