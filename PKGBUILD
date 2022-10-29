# Maintainer: Jake <aur@ja-ke.tech>
pkgname=script-communicator
pkgver=5.19
_pkgver=0${pkgver/./_}
pkgrel=1
pkgdesc="A Qt5-based scriptable terminal with Serial/TCP/UDP/SPI/CAN support"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/scriptcommunicator/"
license=('GPL3')
depends=('qt5-script' 'qt5-serialport' 'qt5-multimedia')
makedepends=('qt5-tools')

source=("https://github.com/szieke/ScriptCommunicator_serial-terminal/archive/Release_${_pkgver}.zip"
        "$pkgname.desktop")
sha256sums=('120be181e144eb914c9548245e7e002bff699b81e1a684b0dfc75d601a080a9e'
            'b77a9dc91f2b4613acee84f0e50f21279c04110f4a7dc46cc0a3d4b2ca0b6cac')


prepare() {
	mv ScriptCommunicator_serial-terminal-Release_${_pkgver}/ScriptCommunicator/ ${pkgname}
	cd $pkgname
	echo "DESTDIR = build" >> ScriptCommunicator.pro
	echo "DESTDIR = build" >> ScriptEditor/ScriptEditor.pro
}

build() {
	cd $pkgname
	qmake -o Makefile ScriptCommunicator.pro
	make --no-print-directory
	
	cd ScriptEditor/
	qmake -o Makefile ScriptEditor.pro
	make --no-print-directory
}


package() {
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	
	cd $pkgname	
	install -Dm644 "images/main_32x32.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	
	mkdir -p "$pkgdir/opt/$pkgname"
	install -Dm755 "build/ScriptCommunicator" "$pkgdir/opt/$pkgname/"
	mkdir -p "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/ScriptCommunicator" "$pkgdir/usr/bin/$pkgname"
	cp -r templates exampleScripts documentation "$pkgdir/opt/$pkgname/"
	
	cd ScriptEditor/
	install -Dm755 "build/ScriptEditor" "$pkgdir/opt/$pkgname/"
	ln -s "/opt/$pkgname/ScriptEditor" "$pkgdir/usr/bin/script-editor"
}
