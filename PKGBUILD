# Maintainer: Presence <dan465 at mail dot com>

pkgname=pyobd
pkgver=0.9.3
pkgrel=1
pkgdesc="An OBD-II compliant car diagnostic tool"
arch=('any')
url="http://www.obdtester.com/pyobd"
license=('GPL')
depends=('wxpython' 'python2-pyserial' 'hicolor-icon-theme')
install=pyobd.install
source=(http://www.obdtester.com/download/${pkgname}_${pkgver}.tar.gz
        pyobd.png)
sha256sums=('f3004db4000e2bc166aae3b4342c98aa62f74f3372c5829472af0ee56c5e110c'
            '14d0d90dcda38c339dc8397f004923075f6d4fce37b7c8539021f4a77b3a86fd')

prepare() {
	cd "$srcdir/${pkgname}-${pkgver}"

	#Fix desktop file
	sed -i -e "s#/usr/share/pyobd/pyobd.gif#$pkgname#" \
		-e "s#python /usr/bin/pyobd#$pkgname#" \
		-e "s#Name=pyOBD: OBD2 Diagnostics#Name=pyOBD\nGenericName=OBD2 Diagnostics#" \
		"pyobd.desktop"

	#Set executable to run with python2
	sed -i "s%#!/usr/bin/env python%#!/usr/bin/python2%" "pyobd"
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"

	install -Dm644 "pyobd.desktop"      "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "$srcdir/pyobd.png"  "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
	install -Dm644 "COPYING"            "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -Dm755 "pyobd"              "$pkgdir/usr/lib/$pkgname/pyobd"
	install -m644 -t "$pkgdir/usr/lib/$pkgname/" *.py{,c}

	mkdir -p "$pkgdir/usr/bin/"
	ln -sf "../lib/$pkgname/pyobd" "$pkgdir/usr/bin/$pkgname"
}

