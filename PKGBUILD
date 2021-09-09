# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=asignify
pkgver=1.0
pkgrel=2
pkgdesc="Yet another signify tool"
arch=('i686' 'x86_64')
license=('BSD')
url="https://github.com/vstakhov/asignify"
depends=('openssl')
makedepends=('cmake')
provides=('libasignify.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        '001-blake2.patch')
sha256sums=('81272713900b51049633139549181fa23e56eeb580e0ea0325546d2fe7ca503d'
            '419d305985f2d4fb4e3d2ef54bd4a098a159d3276e91f0a9bc13c17d28ef6877')

prepare() {
	patch -p1 -d "$pkgname-$pkgver" < 001-blake2.patch
	sed -i '/mandir/s/prefix/datarootdir/' "$pkgname-$pkgver/docs/Makefile.am"
}

build() {
	cd "$pkgname-$pkgver"
	./autogen.sh
	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--datadir=/usr/share \
		--libexecdir=/usr/lib/asignify \
		--sysconfdir=/etc \
		--sharedstatedir=/usr/share/asignify \
		--localstatedir=/var/lib/asignify \
		--with-gnu-ld \
		--enable-openssl
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install DESTDIR="$pkgdir/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
