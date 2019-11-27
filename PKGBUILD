# Maintainer: Ryan Farley <ryan.farley@gmx.com>
# Contributor: Andreas Bosch (progandy) <linux+aur@progandy.de>
pkgname=fonttosfnt-git
pkgver=r83.c214ab0
pkgrel=1
pkgdesc="Convert a set of bdf or pcf fonts into a bitmap only sfnt (otb)"
arch=(x86_64)
url="https://gitlab.freedesktop.org/xorg/app/fonttosfnt"
license=('MIT')
depends=(libfontenc freetype2)
makedepends=(git make autoconf automake xproto xorg-util-macros)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.freedesktop.org/xorg/app/fonttosfnt.git'
	'0001-let-freetype-handle-ISO-8859-1-mapping.patch'
	'0002-allow-ISO-646.1991-IRV-as-well-adobe-standard-for-bd.patch'
	'0003-check-for-freetype-NULL-atoms.patch'
	'0004-improve-guess-font-size.patch')
md5sums=('SKIP'
         'c9a2934334f46681f1a6131d4fd13077'
         '1b542636d9a95d9bb6095c12aa20eb3a'
         '9ba2b5498590e75859099cd57c970ac3'
         '1152c9c998813c003df379813aac2c7c')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	patch --forward --strip=1 --input="$srcdir/0001-let-freetype-handle-ISO-8859-1-mapping.patch"
	patch --forward --strip=1 --input="$srcdir/0002-allow-ISO-646.1991-IRV-as-well-adobe-standard-for-bd.patch"
	patch --forward --strip=1 --input="$srcdir/0003-check-for-freetype-NULL-atoms.patch"
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
