# Maintainer: Ryan Farley <ryan.farley@gmx.com>
pkgname=fonttosfnt-git
pkgver=r83.c214ab0
pkgrel=1
pkgdesc="Convert a set of bdf or pcf fonts into a bitmap only sfnt (otb)"
arch=(x86_64)
url="https://gitlab.freedesktop.org/xorg/app/fonttosfnt"
license=('MIT')
depends=(libfontenc freetype2)
makedepends=(git libfontenc freetype2) # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.freedesktop.org/xorg/app/fonttosfnt.git'
	'0001-read-let-freetype-handle-8859-1-mapping.patch')
md5sums=('SKIP'
         '85945e798ebe976d1fba94ea039b625c')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	patch --forward --strip=1 --input="${srcdir}/0001-read-let-freetype-handle-8859-1-mapping.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
