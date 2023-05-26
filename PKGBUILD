# Maintainer: John Sanpe <sanpeqf@gmail.com>
pkgname=bfdev-devel-git
_gitname=bfdev
pkgver=r229.048f0c7
pkgrel=1
pkgdesc="An open source development library"
arch=(any)
url="https://github.com/openbfdev/bfdev.git"
branch="devel"
license=('GPL')
makedepends=('git')
source=("${_gitname}::git+${url}#branch=${branch}")
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
	cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -S ${_gitname%-git}
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
