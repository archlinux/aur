# Maintainer: xiretza <xiretza+aur@gmail.com>
pkgname=aiger
pkgver=1.9.9
pkgrel=2
pkgdesc="A format, library and set of utilities for And-Inverter Graphs (AIGs)"
arch=(x86_64)
url="http://fmv.jku.at/aiger/"
license=('MIT' 'BSD')
source=("http://fmv.jku.at/aiger/$pkgname-$pkgver.tar.gz"
        "makefile-install.patch"
        "configure-sh-commas-in-cflags.patch")
sha256sums=('1e50d3db36f5dc5ed0e57aa4c448b9bcf82865f01736dde1f32f390b780350c7'
            '7103083de75ad6af76ee5272ba3c372741ccf1bcbd88fee6902eba8f2a0e416e'
            'e7abca2a8ed4a3fd36d8b65c2b9e7ab79210729f23b3130c5065f4c1b1ec1234')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 < "$srcdir/makefile-install.patch"
	patch -p1 < "$srcdir/configure-sh-commas-in-cflags.patch"
}

build() {
	cd "$pkgname-$pkgver"
	env CFLAGS="$CFLAGS $LDFLAGS" ./configure.sh
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install

	install -d "$pkgdir/usr/share/$pkgname"
	cp -r examples/ "$pkgdir/usr/share/$pkgname/"
	rm "$pkgdir/usr/share/$pkgname/examples/.cvsignore"

	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
