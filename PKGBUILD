# Maintainer: Ignacio Losiggio <iglosiggio@dc.uba.ar>
pkgname=ldpl-git
pkgver=3.0.5.r21.72d49f8
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
md5sums=('SKIP' 'dc344057eee2032c7b49562b507db99a')

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
