# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname='libretro-swanstation'
pkgname=${_pkgname}-git
provides=(${_pkgname})
conflicts=(${_pkgname})
pkgver=r5790.37674474
pkgrel=1
pkgdesc='SwanStation is an open-source Libretro core implementation of DuckStation, a PSX emulator.'
url="https://github.com/libretro/swanstation"
license=('GPL3')
depends=('libretro-core-info')
makedepends=('cmake' 'git')
arch=('x86_64' 'i686')
sha256sums=('SKIP')
source=("git+${url}.git")

_srcdir='swanstation'

pkgver() {
	cd "${_srcdir}"
	( set -o pipefail
		git describe --abbrev=7 --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cmake -S ${_srcdir} -B 'build' -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX='/usr'
	cmake --build 'build'
}

package() {
	#DESTDIR="${pkgdir}" cmake --install 'build'
	install -Dm755 'build/swanstation_libretro.so' -t "${pkgdir}/usr/lib/libretro"
	install -Dm644 "${_srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
