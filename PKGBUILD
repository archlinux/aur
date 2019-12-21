# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=libclsp-git
pkgver=r20.d4a4804
pkgrel=1
epoch=
pkgdesc="A C++17 library for language servers"
arch=('x86_64')
url="https://github.com/otreblan/libclsp"
license=('GPL3')
groups=()
depends=('boost-libs')
makedepends=('git' 'cmake' 'boost' 'rapidjson')
checkdepends=()
optdepends=()
provides=('libclsp')
conflicts=('libclsp')
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')

prepare() {
	mkdir -p "${pkgname}/build"
}

pkgver() {
	cd "$srcdir/$pkgname"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/^v-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "${pkgname}/build" || exit 1
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_UNITY_BUILD=ON \
		..
	make
}

package() {
	cd "${pkgname}/build" || exit 1
	make DESTDIR="$pkgdir/" install
}
