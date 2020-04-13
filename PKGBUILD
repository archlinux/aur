# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=libtree-git
pkgver=1.0.0.r10.g8a8de63
pkgrel=1
pkgdesc="ldd as a tree with an option to bundle dependencies into a single folder "
arch=('x86_64')
url="https://github.com/otreblan/libtree"
license=('MIT')
depends=('cppglob')
makedepends=('git' 'cmake' 'cxxopts' 'termcolor' 'elfio')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
md5sums=('SKIP')

prepare() {
	mkdir -p "${pkgname%-git}/build"
}

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/^v-\?//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "${pkgname%-git}/build" || exit 1

	cmake \
		-DUSE_SYSTEM_DEPS=ON \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_UNITY_BUILD=ON \
		-DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
		..
	make
}

package() {
	cd "${pkgname%-git}/build" || exit 1

	make DESTDIR="$pkgdir/" install
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
