# Maintainer: David Wu <xdavidwuph@gmail.com>

pkgname=lightspark
pkgver=0.8.2
pkgrel=1
pkgdesc='An open source flash player implementation'
url='https://github.com/lightspark/lightspark'
arch=('x86_64')
license=('LGPL3')
depends=('libgl' 'curl' 'ffmpeg' 'zlib' 'glew' 'pcre' 'rtmpdump' 'cairo' 'sdl2' 'sdl2_mixer' 'libjpeg' 'pango' 'xz' 'boost-libs' 'glibmm')
makedepends=('cmake' 'nasm' 'ninja' 'boost')
conflicts=('pepper-flash')
source=("https://github.com/lightspark/lightspark/archive/${pkgver}.tar.gz"
        'https://patch-diff.githubusercontent.com/raw/lightspark/lightspark/pull/409.patch')
sha512sums=('0ff636ad59523726232d9c2105843dc9ea835526c300bca7833e6d1a0ebf7630c1d10109143baabc16f95c1c954094603c945b705a6c9fb02f369e94fead034e'
            '85b095d74c548e815caaf83fe1893d2bdf4e6bcada98e9d0aed381de5bc2ed50edbfd144dc3996f6a0423645d3c9574047b4f55cde53dee43ff6888735bc0aca')

build() {
	cd "${pkgname}-${pkgver}"
	# [PATCH] Fix build with boost 1.72.0.
	patch -p1 -i ../409.patch
	mkdir -p build
	cd build
	cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
	ninja
}

package() {
	cd "${pkgname}-${pkgver}/build"
	DESTDIR="${pkgdir}" ninja install
}
