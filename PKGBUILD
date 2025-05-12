# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=yamc-git
provides=('yamc')
conflicts=('yamc')
pkgver=r223.4e015a7
pkgrel=2
pkgdesc='C++ mutex (mutual exclusion primitive for multi-threading) collections. This is header-only, cross-platform, no external dependency C++11 library.'
url='https://github.com/yohhoy/yamc'
license=('MIT')
depends=()
makedepends=('cmake' 'git')
arch=('any')
optdepends=()
checkdepends=('gtest')
sha256sums=('SKIP'
            '2976710e913d98ec23a7e4e9520e12dafef861bc47bffdef43f7f0862c794805')
_repo='yamc'
source=(
	"git+${url}.git"
	'yamc-fix-tests.patch')

pkgver() {
	cd "${_repo}"
	( set -o pipefail
		git describe --tags --abbrev=7 --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

prepare() {
	cd "${_repo}"
	patch -p1 -i "${srcdir}/yamc-fix-tests.patch"
}

build() {
	cmake -S "${_repo}" -B 'build' -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_TESTING=OFF
	cmake --build 'build'
}

check() {
	cmake -S "${_repo}" -B 'build' -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_TESTING=ON
	cmake --build 'build'
	cmake --build 'build' --target test
}

package() {
	DESTDIR="${pkgdir}" cmake --install 'build'
	install -Dm644 "${_repo}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
