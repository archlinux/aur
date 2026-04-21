# Maintainer: Ari43 <arirera43 [at] gmail [dot] com>

_name='VapoR'
_pkgname="vapor-openvr"
pkgname="$_pkgname-git"
pkgver=r44.0801406
pkgrel=1
pkgdesc="An experimental implementation of an OpenVR runtime on top of OpenXR/Monado"
arch=(x86_64)
url="https://github.com/micheal65536/VapoR"
license=('BSD-2-Clause')
makedepends=('git' 'make' 'cmake')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=('git+https://github.com/micheal65536/VapoR')
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
	cd "$srcdir/${_name}"
	cmake CMAKE_INSTALL_DATADIR="/opt/${_name}/" -B build -S . 
	cmake --build build
}

package() {
	install -Dm644 \
		"${srcdir}/${_name}/build/openvrpaths.vrpath" \
		"${pkgdir}/opt/${_name}/openvrpaths.vrpath"
	install -Dm644 \
		"${srcdir}/${_name}/build/version.txt" \
		"${pkgdir}/opt/${_name}/bin/version.txt"
	install -Dm755 \
		"${srcdir}/${_name}/build/src/vrclient.so" \
		"${pkgdir}/opt/${_name}/bin/linux64/vrclient.so"
}
