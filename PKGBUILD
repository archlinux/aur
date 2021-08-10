# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=asignify-git
pkgver=1.0.r41.g215a53d
pkgrel=1
epoch=1
pkgdesc="Yet another signify tool"
arch=('i686' 'x86_64')
license=('BSD')
url="https://github.com/vstakhov/asignify"
depends=('openssl')
makedepends=('git' 'cmake')
provides=('asignify' 'libasignify.so')
conflicts=('asignify')
source=("$pkgname::git+$url"
        '001-blake2.patch')
sha256sums=('SKIP'
            '419d305985f2d4fb4e3d2ef54bd4a098a159d3276e91f0a9bc13c17d28ef6877')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/-/.r/;s/-/./'
}

prepare() {
	patch -p1 -d "$pkgname" < 001-blake2.patch
	sed -i '/mandir/s/prefix/datarootdir/' "$pkgname/docs/Makefile.am"
}

build() {
	cd "$pkgname"
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
	cd "$pkgname"
	make install DESTDIR="$pkgdir/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
