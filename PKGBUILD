# Maintainer: Jake <ja.ke@posteo.de>
pkgname=script-communicator
pkgver=3_29
pkgrel=1
pkgdesc="Scriptable terminal with Serial/TCP/UDP/SPI/CAN support"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/scriptcommunicator/"
license=('GPL3')
depends=('qt5-script' 'qt5-serialport')
makedepends=('qt5-tools')

source=("http://sourceforge.net/projects/scriptcommunicator/files/Source/ScriptCommunicator_${pkgver}_source.zip" 
	"qmake.patch"
	"$pkgname.desktop")
md5sums=('b77ae0b2dfdc1a7a8625b29be55925ea'
         '126ac5abe605c069119f85d9fc0fa4c5'
         'f1b6721b942570e9f5349acbef5992b0')


prepare() {
	cd "ScriptCommunicator_${pkgver}_source"	
	patch -i "$srcdir/qmake.patch"
}

build() {
	cd "ScriptCommunicator_${pkgver}_source"
	qmake -o Makefile ScriptCommunicator.pro
	make
}


package() {
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	cd "ScriptCommunicator_${pkgver}_source"
	install -Dm644 "images/main.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	
	mkdir -p "$pkgdir/opt/$pkgname"
	install -Dm755 "build/ScriptCommunicator" "$pkgdir/opt/$pkgname/"
	mkdir -p "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/ScriptCommunicator" "$pkgdir/usr/bin/$pkgname"
	cp -r templates exampleScripts documentation "$pkgdir/opt/$pkgname/"
}
