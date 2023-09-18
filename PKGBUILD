# Maintainer: Manuel Hüsers <aur@huesers.de>

pkgbase=obs-vkcapture
pkgname=("$pkgbase" "lib32-$pkgbase")
pkgver=1.4.3
pkgrel=1
url="https://github.com/nowrep/$pkgbase"
license=('GPL2')
arch=('x86_64')
depends=('vulkan-icd-loader' 'libgl' 'libegl' 'obs-studio>=27')
makedepends=('gcc' 'cmake' 'vulkan-headers' 'lib32-gcc-libs' 'lib32-vulkan-icd-loader' 'lib32-libgl' 'lib32-libegl')
source=("https://github.com/nowrep/$pkgbase/archive/v$pkgver/$pkgbase-$pkgver.tar.gz")
sha512sums=('be5917b1e25ccb17c964ac95f15ca05ab151650652f106a5c22d6b7344b2d20e5b265afa664eb74130c819990eaaa6822fa73fbf9085c35b4c041d0058e570a0')

build() {
	cmake -B build -S "$pkgbase-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DCMAKE_INSTALL_DATADIR=/share \
		-DCMAKE_BUILD_TYPE=Release
	cmake --build build

	export CFLAGS="-m32 ${CFLAGS}"
	export CXXFLAGS="-m32 ${CXXFLAGS}"
	export LDFLAGS="-m32 ${LDFLAGS}"

	cmake -B build32 -S "$pkgbase-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib32 \
		-DCMAKE_INSTALL_DATADIR=/share \
		-DCMAKE_LIBRARY_PATH=/usr/lib32 \
		-DCMAKE_BUILD_TYPE=Release \
		-DBUILD_PLUGIN=OFF
	cmake --build build32
}

package_obs-vkcapture() {
	pkgdesc='OBS Linux Vulkan/OpenGL game capture'

	DESTDIR="$pkgdir" cmake --install build
}

package_lib32-obs-vkcapture() {
	pkgdesc='OBS Linux Vulkan/OpenGL game capture (32-bit)'
	depends=('lib32-vulkan-icd-loader' 'lib32-libgl' 'lib32-libegl')

	DESTDIR="$pkgdir" cmake --install build32
	rm -r "$pkgdir/usr/bin"
}
