# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname='sharedaccess'
pkgname=${_pkgname}-git
provides=(${_pkgname})
conflicts=(${_pkgname})
pkgver=1.2.7.r0.gca33cf5
pkgrel=1
pkgdesc='C++17 library to make sharing a resource with multiple threads easier.'
url="https://gitlab.com/patlefort/${_pkgname}"
license=('GPL3')
depends=()
makedepends=('cmake' 'git')
arch=('any')
optdepends=('boost: provide upgradeable locks')
sha256sums=('SKIP')
source=("git+${url}.git")

pkgver() {
	cd "${_pkgname}"
	( set -o pipefail
		git describe --tags --abbrev=7 --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

build() {
	cmake -S ${_pkgname} -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
}
