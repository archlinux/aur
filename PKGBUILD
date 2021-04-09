# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=yamc-git
provides=("yamc")
conflicts=("yamc")
pkgver=r217.fc378ad
pkgrel=2
pkgdesc="C++ mutex (mutual exclusion primitive for multi-threading) collections. This is header-only, cross-platform, no external dependency C++11 library."
url="https://github.com/yohhoy/yamc"
license=("MIT")
depends=()
makedepends=("cmake" "git")
arch=("any")
optdepends=()
checkdepends=('git')
sha256sums=("SKIP")
_repo="yamc"
source=("git+https://github.com/yohhoy/${_repo}")

pkgver() {
	cd "${_repo}"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cmake -S "${_repo}" -B "build" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_TESTING=OFF
	cmake --build "build"
}

check() {
	cmake -S "${_repo}" -B "build" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_TESTING=ON
	cmake --build "build"
	cmake --build "build" --target test
}

package() {
	DESTDIR="${pkgdir}" cmake --install "build"
	install -Dm644 "${_repo}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
