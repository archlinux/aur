# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgdesc='Game Engine meets a Display Server meets a Multimedia Framework'
pkgname='arcan-git'
pkgver=r4447.433241c2
pkgrel=1
license=('GPL2' 'LGPL' 'custom:BSD')
arch=(aarch64 'x86_64')
depends=('freetype2' 'harfbuzz' 'harfbuzz-icu' 'mesa' 'luajit' 'sqlite'
         'libxkbcommon' 'libvncserver' 'libusb' 'openal' 'ffmpeg' 'apr' 'wayland-protocols'
         'libuvc' 'xcb-util' 'xcb-util-wm')
makedepends=('cmake' 'ruby' 'git')
provides=('arcan')
conflicts=('arcan')
url='https://arcan-fe.com/'
source=("${pkgname}::git+https://github.com/letoram/arcan.git"
        "0001-fix-build-werror.patch")
sha512sums=('SKIP'
            'd2eb7c699753ed5ab359b7b34979b7d5eee2fc7356c803c37f68f7dc919586d1698da05377ad16b77dfb458668562805002e0334e4b309260939182ef17a1934')

pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare () {
  cd "${srcdir}"
  patch -Np1 -i 0001-fix-build-werror.patch
}

build () {
	pushd "${pkgname}/doc" &> /dev/null
	ruby docgen.rb mangen
	popd &> /dev/null

	cmake -B build -S "$pkgname/src" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DVIDEO_PLATFORM=egl-dri \
		-DHYBRID_SDL=ON \
		-DENABLE_LWA=ON \
		-DENABLE_LTO=ON
	cmake --build build
}

package () {
	DESTDIR="${pkgdir}" cmake --install build
}
