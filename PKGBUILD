# Maintainer: Jake <ja.ke@posteo.de>
pkgname=script-communicator
pkgver=4.11
_pkgver=04_11
pkgrel=1
pkgdesc="Scriptable terminal with Serial/TCP/UDP/SPI/CAN support"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/scriptcommunicator/"
license=('GPL3')
depends=('qt5-script' 'qt5-serialport')
makedepends=('qt5-tools' 'dos2unix' 'icoutils')

source=("http://sourceforge.net/projects/scriptcommunicator/files/Source/ScriptCommunicator_${_pkgver}_source.zip" 
	"qmake.patch"
	"$pkgname.desktop")
md5sums=('46a4b85f4bc08dc78507fd2fad0bce0f'
         'efe580480b123884895d7aadad495921'
         '2178766b1e5dcccffe29d666625d111a')


prepare() {
	cd "ScriptCommunicator_${_pkgver}_source"
	dos2unix ScriptCommunicator.pro
	patch -i "$srcdir/qmake.patch"
}

build() {
	cd "ScriptCommunicator_${_pkgver}_source"
	qmake -o Makefile ScriptCommunicator.pro
	make
}


package() {
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	cd "ScriptCommunicator_${_pkgver}_source"	
	
	icotool -x images/main.ico -i 1 -o images/main.png
	install -Dm644 "images/main.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	
	mkdir -p "$pkgdir/opt/$pkgname"
	install -Dm755 "build/ScriptCommunicator" "$pkgdir/opt/$pkgname/"
	mkdir -p "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/ScriptCommunicator" "$pkgdir/usr/bin/$pkgname"
	cp -r templates exampleScripts documentation "$pkgdir/opt/$pkgname/"
}
