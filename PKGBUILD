# Contributor: Patrick Northon <northon_patrick3@yahoo.ca>
# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=sharedaccess-git
provides=("sharedaccess")
conflicts=("sharedaccess")
pkgver=1.1.0.r0.ga893525
pkgrel=1
pkgdesc="C++17 library to make sharing a resource with multiple threads easier."
url="https://gitlab.com/patlefort/sharedaccess"
license=("GPL3")
depends=()
makedepends=("cmake")
arch=("any")
optdepends=("boost: provide upgradeable locks")
sha256sums=("SKIP")
_repo="sharedaccess"
source=("git+https://gitlab.com/patlefort/${_repo}")

pkgver() {
	cd "${_repo}"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cmake -S ${_repo} -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	make -C build
}

package() {
	make DESTDIR="${pkgdir}" -C build install
	install -Dm644 "${_repo}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
