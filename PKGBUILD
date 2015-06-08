# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=corsix-th
pkgver=0.40
pkgrel=1
pkgdesc='Reimplementation of the game engine of Theme Hospital'
url='https://github.com/CorsixTH/CorsixTH/'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
makedepends=('cmake')
depends=('lua51' 'sdl_mixer' 'ffmpeg' 'timidity-freepats')
source=("${url}archive/v${pkgver}.tar.gz"
        'bin')
sha1sums=('2e88e319f8c73e83068c8db08f1598cc097b2b27'
          '7fd6ae8db366b7f9c4671708e8ea7beb48f1bea3')

# If you do not have a copy of Theme Hospital,
# you can download the data files of the demo:
#   http://th.corsix.org/Demo.zip

build() {
	cd "${srcdir}/CorsixTH-${pkgver}"
	cmake \
		-D LUA_INCLUDE_DIR=/usr/include/lua5.1 \
		-D LUA_LIBRARY=/usr/lib/liblua5.1.so \
		-D CMAKE_INSTALL_PREFIX=/usr/share/ \
		-D CMAKE_BUILD_TYPE=Release \
		-Wno-dev .
	cd CorsixTH
	make
}

package() {
	cd "${srcdir}/CorsixTH-${pkgver}/CorsixTH"
	make DESTDIR="${pkgdir}" install
	install -Dm755 ../../bin "${pkgdir}/usr/bin/CorsixTH"
	install -Dm644 ../LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 ../DebianPackage/usr/share/applications/CorsixTH.desktop "${pkgdir}/usr/share/applications/CorsixTH.desktop"
	sed -e 's/games/share/g' -i "${pkgdir}/usr/share/applications/CorsixTH.desktop"
}
