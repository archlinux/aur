# Maintainer: John Sanpe <sanpeqf@gmail.com>
pkgname=csum-git
_gitname=csum
pkgver=r11.e400ed3
pkgrel=1
pkgdesc="More powerful verification tools"
arch=(any)
url="https://github.com/openbfdev/csum.git"
branch="devel"
license=('GPL')
makedepends=('git')
source=("${_gitname}::git+${url}")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "${srcdir}/${_gitname}"
	git submodule update --init
	cd -
	cmake -B build -S ${_gitname%-git} \
		-D CMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
