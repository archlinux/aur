# Maintainer:  Ilya Chelyadin <ilya77105@gmail.com>

pkgname=winbond-kbdbl-git
pkgver=1.1
pkgrel=1
pkgdesc='Manage color profiles and backlight of Winbond based keyboard (Tyrfing V2, ZET Blade, etc.)'
arch=('i686' 'x86_64')
url="https://github.com/brainrom/winbond-kbdbl"
license=('MIT')
depends=('python-pyusb' 'python-colour')
makedepends=('git')
source=('git+https://github.com/brainrom/winbond-kbdbl')
sha256sums=('SKIP')

build() {
		cat <<-'EOF' > ./winbond-kbdbl@.service
		[Unit]
		Description=Allow user access to keyboard backlight
		After=graphical.target
		
		[Service]
		User=%i
		WorkingDirectory=/usr/lib/winbond-kbdbl
		ExecStart=env DISPLAY=:0 /usr/bin/python3 -m kbdbl -d

		Restart=on-failure
		RestartSec=10s
		
	EOF

	cat <<-'EOF' > ./winbond-kbdbl.sh
		#!/bin/bash
		cd /usr/lib/winbond-kbdbl
		/usr/bin/python3 -m kbdbl "$@"
	EOF
}

package(){
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/lib/winbond-kbdbl/kbdbl"
  mkdir -p "$pkgdir/usr/lib/udev/rules.d/"
  install -m 0644 winbond-kbdbl/kbdbl/* "$pkgdir/usr/lib/winbond-kbdbl/kbdbl"
  install -m 0644 winbond-kbdbl/utils/50-winbondkbd-userlevel.rules "$pkgdir/usr/lib/udev/rules.d/"
  install -D -m 0644 winbond-kbdbl@.service "$pkgdir/usr/lib/systemd/system/winbond-kbdbl@.service"
  install -D -m 0755 winbond-kbdbl.sh "$pkgdir/usr/bin/winbond-kbdbl"
  }
