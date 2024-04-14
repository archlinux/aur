# Maintainer: John Sanpe <sanpeqf@gmail.com>
pkgname=xdbd-git
_gitname=xdbd
pkgver=r4.a39c864
pkgrel=1
pkgdesc="An open source development library"
arch=(any)
url="https://github.com/openbfdev/xdbd.git"
branch="master"
license=('GPL')
makedepends=('git' 'cmake' 'make' 'gcc' 'fakeroot')
source=("${_gitname}::git+${url}#branch=${branch}")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" ||
		git submodule update --init --recursive
	)
}

build() {
	cmake -B build -S ${_gitname%-git} \
		-D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=Release
	cmake --build build -j$(nproc)
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
