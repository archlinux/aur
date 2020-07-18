# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=lazycsv-git
pkgver=r3.d1b1ce8
pkgrel=1
epoch=
pkgdesc="A blazing fast single-header library for reading and parsing csv files in c++"
arch=('any')
url="https://github.com/ashtum/lazycsv"
license=('MIT')
groups=()
depends=()
makedepends=('git' 'cmake')
checkdepends=()
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	mkdir -p "build"

	sed -i "s/VERSION 3.8/VERSION 3.13/" CMakeLists.txt
}

pkgver() {
	cd "$srcdir/$pkgname"

	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/^v-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$srcdir/$pkgname/build"

	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_UNITY_BUILD=ON \
		-DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
		..

	make
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	cd "build"

	make DESTDIR="$pkgdir/" install
}
