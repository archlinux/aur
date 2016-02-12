# Maintainer: Jake <ja.ke@posteo.de>
pkgname=script-communicator
_fullname=ScriptCommunicator_04_02_source
pkgver=4.02
pkgrel=1
pkgdesc="Scriptable terminal with Serial/TCP/UDP/SPI/CAN support"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/scriptcommunicator/"
license=('GPL3')
depends=('qt5-script' 'qt5-serialport')
makedepends=('qt5-tools' 'dos2unix')

source=("http://sourceforge.net/projects/scriptcommunicator/files/Source/${_fullname}.zip" 
	"qmake.patch"
	"$pkgname.desktop")
md5sums=('38d4c47739f8468a8dd1d3504b7e4ad9'
         'efe580480b123884895d7aadad495921'
         'f1b6721b942570e9f5349acbef5992b0')


prepare() {
	cd "${_fullname}"
	dos2unix ScriptCommunicator.pro
	patch -i "$srcdir/qmake.patch"
}

build() {
	cd "${_fullname}"
	qmake -o Makefile ScriptCommunicator.pro
	make
}


package() {
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	cd "${_fullname}"
	install -Dm644 "images/main.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	
	mkdir -p "$pkgdir/opt/$pkgname"
	install -Dm755 "build/ScriptCommunicator" "$pkgdir/opt/$pkgname/"
	mkdir -p "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/ScriptCommunicator" "$pkgdir/usr/bin/$pkgname"
	cp -r templates exampleScripts documentation "$pkgdir/opt/$pkgname/"
}
