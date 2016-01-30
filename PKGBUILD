# Maintainer: Jake <ja.ke@posteo.de>
pkgname=script-communicator
pkgver=4_00
pkgrel=1
pkgdesc="Scriptable terminal with Serial/TCP/UDP/SPI/CAN support"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/scriptcommunicator/"
license=('GPL3')
depends=('qt5-script' 'qt5-serialport')
makedepends=('qt5-tools' 'dos2unix')

source=("http://sourceforge.net/projects/scriptcommunicator/files/Source/ScriptCommunicator_${pkgver}_source.zip" 
	"qmake.patch"
	"$pkgname.desktop")
md5sums=('ec5742772a600147ae5f78fb9dfe6fe1'
         'efe580480b123884895d7aadad495921'
         'f1b6721b942570e9f5349acbef5992b0')


prepare() {
	cd "ScriptCommunicator_${pkgver}_source"
	dos2unix ScriptCommunicator.pro
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
