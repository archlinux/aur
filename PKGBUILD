# Maintainer: Pico Paco Nano <founderofjp@gmail.com>
# Contributer: felix.s <felix.von.s@posteo.de>
pkgbase=weborf
pkgname=(weborf qweborf)
pkgver=0.14
pkgrel=1
url='https://ltworf.github.io/weborf/'
arch=(i686 x86_64)
license=(GPL3)
source=(
	"https://github.com/ltworf/weborf/releases/download/${pkgver}/weborf_${pkgver}.orig.tar.gz"
#	"https://github.com/ltworf/weborf/releases/download/${pkgver}/weborf_${pkgver}.orig.tar.gz.asc"
)
sha256sums=(
	'921f12537f685c067571dc6252e2ccc09a9068239b37f565f50b1eeccb901359'
#	'SKIP'
)
#validpgpkeys=('42748B9E76D899799E1FBE14B3A7CF0C801886CF')
# Salvo 'LtWorf' Tomaselli (many e-mail addresses)
makedepends=()

for _pkg in "${pkgname[@]}"; do case "$_pkg" in

qweborf*)
	makedepends+=(python-pyqt5)
;;

esac; done

build() {
	cd "$srcdir/weborf-${pkgver}"

	for _pkg in "${pkgname[@]}"; do case "$_pkg" in

	weborf*)
		./configure --prefix=/usr --sysconfdir=/etc
		make
	;;

	qweborf*)
		pyuic5 qweborf/main.ui > qweborf/main.py
		python qweborf.setup.py build
	;;

	esac; done
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
