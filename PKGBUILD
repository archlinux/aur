# Maintainer: Jake <ja.ke@posteo.de>
pkgname=script-communicator
pkgver=4.18
_pkgver=0${pkgver/./_}
pkgrel=1
pkgdesc="ScriptCommunicator is a scriptable terminal with Serial/TCP/UDP/SPI/CAN support"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/scriptcommunicator/"
license=('GPL3')
depends=('qt5-script' 'qt5-serialport')
makedepends=('qt5-tools')

source=("https://github.com/szieke/ScriptCommunicator_serial-terminal/archive/Release_${_pkgver}.zip" 
	"qmake.patch"
	"$pkgname.desktop")
sha256sums=('804f42ec28de0c95d772ad1a864301d73c3e5221f92102848f087c8793174be5'
            '42d4c91d7313281e41588d7d75016ab30695bf057e81197fa09a904cb3311b6e'
            'a6ff5c6079a0af0c5bc47c8f660073fcfc31c22a68b57d98f454542aaa560566')


prepare() {
	mv ScriptCommunicator_serial-terminal-Release_${_pkgver}/ScriptCommunicator/ ${pkgname}
	cd $pkgname
	patch -i "$srcdir/qmake.patch"
}

build() {
	cd $pkgname
	qmake -o Makefile ScriptCommunicator.pro
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
}
