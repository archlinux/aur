# Maintainer: Ignacio Losiggio <iglosiggio@dc.uba.ar>
pkgname=ldpl-git
pkgver=4.4.r41.d27b8e4
pkgrel=1
pkgdesc="COBOL inspired language, designed to be expressive, fast, readable and easy to learn."
arch=('x86_64')
url="https://www.ldpl-lang.org/"
license=('GPL3')
depends=('gcc-libs')
makedepends=('git' 'awk')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/Lartu/ldpl.git" "dont-do-mandb.patch")
md5sums=('SKIP' '2764e75489cfc352d2bad67f554d2cc6')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	patch -p1 -i "$srcdir/dont-do-mandb.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}/src"
	make LFLAGS="$LDFLAGS"
}

package() {
	cd "$srcdir/${pkgname%-git}/src"
	make PREFIX=/usr DESTDIR="$pkgdir/" install
}
