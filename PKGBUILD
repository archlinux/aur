# Maintainer: Cyril Andreatta arch@andreatta.ch
# Thanx to Stefan Zieker <s.zieker@gmx.net> and Jake <ja.ke@posteo.de>

pkgname=script-communicator-git
_pkgname_generic=${pkgname%-git}
_name=ScriptCommunicator
_fullname=ScriptCommunicator_serial-terminal
_path=$_fullname/$_name
pkgver=04.14.193
pkgrel=1
pkgdesc="ScriptCommunicator is a scriptable cross-platform data terminal with support for serial port (RS232, USB to serial), UDP, TCP client/server (network proxy support for TCP clients), SPI master (cheetah SPI)
"
arch=('i386' 'x86_64')
url="https://github.com/szieke/ScriptCommunicator_serial-terminal"
license=('LGPL')
groups=()
depends=('qt5-base' 'qt5-serialport' 'qt5-script')
makedepends=('git' 'qt5-tools')
provides=("$_pkgname_generic")
conflicts=("$_pkgname_generic")
replaces=()
backup=()
options=(!strip debug)
source=("git://github.com/szieke/ScriptCommunicator_serial-terminal"
		"$_pkgname_generic.desktop")
noextract=()
md5sums=(SKIP
         '2178766b1e5dcccffe29d666625d111a')

pkgver() {
	cd $_fullname
	printf "$(grep 'VERSION = ' ScriptCommunicator/mainwindow.cpp | cut -d'"' -f2
	).$(git rev-list --count master)"
}

build() {
	cd $_path
	qmake
	make
}

package() {
	install -Dm644 "$_pkgname_generic.desktop" "$pkgdir/usr/share/applications/$pkgname_generic.desktop"

	install -Dm644 "$_path/images/main_32x32.png" "$pkgname/usr/share/pixmaps/$_pkgname_generic.png"

	mkdir -p "$pkgdir/opt/$pkgname"
	install -Dm755 "$_path/ScriptCommunicator" "$pkgdir/opt/$pkgname/$_pkgname_generic"

	mkdir -p "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/$_pkgname_generic" "$pkgdir/usr/bin/$_pkgname_generic"

	cd $_path
	cp -r templates exampleScripts documentation "$pkgdir/opt/$pkgname/"

	make INSTALL_ROOT="/usr/bin/script-communicator" install
}
