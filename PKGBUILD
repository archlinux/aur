# Maintainer: jfperini <@jfperini>
# Contributor: jfperini <@jfperini>

pkgname=dukto
pkgver=R6
pkgrel=1
pkgdesc="A simple, fast and multi-platform file transfer tool for LAN users."
arch=('any')
url="http://www.msec.it/dukto"
license=('GPL v2')
depends=('qt5-quick1' 'qt5-script' 'qt5-xmlpatterns')
makedepends=('subversion')
# conflicts=('')
source=('dukto-qt5.4.patch' "$pkgname"::'svn+http://svn.code.sf.net/p/dukto/code/trunk')
sha256sums=('02cdc944a5d9cbb7b3dd71a09f3789670de38525ee5aa238121fbabb3a81495e' 'SKIP')

prepare() {

	cd "$srcdir/$pkgname"

    	msg2 "  -> Prepare program..."
	#sed -i "47i#include <unistd.h>" qtsingleapplication/qtlocalpeer.cpp
    	msg2 "  -> Fix QT5"
  	patch -p0 -i ../dukto-qt5.4.patch

}

build()
{

	cd "$srcdir/$pkgname"

	msg2 "  -> Build program..."
	qmake $pkgname.pro
	make

}

package (){
  
	cd "$srcdir/$pkgname"

    	msg2 "  -> Installing program..."
  	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"

    	msg2 "  -> Installing icons..."
  	install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

    	msg2 "  -> Installing .desktop file..."
    	echo "[Desktop Entry]
    	Version=1.0
    	Encoding=UTF-8
    	Type=Application
	Name=Dukto
    	GenericName=Transfer files across the LAN
    	Comment=Transfer files across the LAN
    	Exec=$pkgname
    	Icon=$pkgname.png
    	StartupNotify=true
    	Terminal=false 
    	Categories=Network;Application;" | tee "$pkgname.desktop"
    	echo -e "...Ok.\n"

    	install -Dm644  "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

}

# vim: ts=2 sw=2 et: