# Maintainer: Xu Che <chrisxuche@gmail.com>

pkgname=gumbo-query
pkgdesc="A C++ library that provides jQuery-like selectors for Google's Gumbo-Parser."
arch=(x86_64)
pkgver=r1.1111111
pkgrel=1
url="https://github.com/lazytiger/gumbo-query"
license=(MIT)
depends=(gumbo-parser)
checkdepends=()
source=(
	"git+https://github.com/lazytiger/gumbo-query.git#branch=master"
	"no-static.patch"
	"cmake.patch"
	"cmake-test.patch"
)
sha256sums=(
	'SKIP'
	'43059098f2949ed21cd092c46b86cc6bca87c29159bdaf4958aafe61b282d763'
	'a372893d14e177467942c2934d0026a210a53529d9001450a9b97cfee761f5eb'
	'615a488853861c0dc639b892b0c4ad680018247f59a9a87685d1b859677f68ff'
)

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "$srcdir/$pkgname"
	for p in "${srcdir}"/*.patch; do 
		patch -p1 < "$p"
	done
}

build() {
	cd "$srcdir/$pkgname/build"
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
	make
	make doc
}

check() {
	cd "$srcdir/$pkgname/build"
	make test
}

package() {
	cd "$srcdir/$pkgname/build"
	make DESTDIR="$pkgdir" install
}
