# Maintainer: Ari43 <arirera43 [at] gmail [dot] com>
# Contributor: Sapphire <imsapphire0 [at] gmail [dot] com>

_name='VapoR'
_pkgname="vapor-openvr"
pkgname="$_pkgname-git"
pkgver=r44.0801406
pkgrel=4
pkgdesc="An experimental implementation of an OpenVR runtime on top of OpenXR/Monado"
arch=(x86_64)
url="https://github.com/micheal65536/VapoR"
license=('BSD-2-Clause')
makedepends=('git' 'make' 'cmake' 'nlohmann-json' 'vulkan-headers')
depends=('openxr' 'vulkan-icd-loader' 'libgcc' 'libglvnd' 'glibc' 'libx11' 'libstdc++')
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
	cmake -DCMAKE_INSTALL_PREFIX="/opt" -DCMAKE_INSTALL_DATADIR="/opt" -DCMAKE_INSTALL_LIBDIR="/opt" -B build -S .
	cmake --build build
}

package() {
	cd "$srcdir/${_name}"
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 \
		"${srcdir}/${_name}/LICENSE.md" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
