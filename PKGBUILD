_pkgname=xunused
pkgname=${_pkgname}-git
pkgver=r27.c098435
pkgrel=1
pkgdesc="Tool to find unused C/C++ functions and methods"
arch=('x86_64')
url="https://github.com/mgehre/xunused"
license=('Apache-2.0')
depends=(
	clang
	gcc-libs
	glibc
	llvm-libs
)
makedepends=(
	cmake
	git
	llvm
	ninja
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"

	(
		set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

build() {
	cd "$srcdir/${_pkgname}"

	cmake -B build -G Ninja -S . \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev

	cmake --build build
}

package() {
	cd "$srcdir/${_pkgname}"

	DESTDIR="$pkgdir" cmake --install build
}
