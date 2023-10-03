# Maintainer: Manuel Hüsers <aur@huesers.de>

pkgbase=obs-vkcapture
pkgname=("$pkgbase" "lib32-$pkgbase")
pkgver=1.4.4
pkgrel=1
url="https://github.com/nowrep/$pkgbase"
license=('GPL2')
arch=('x86_64')
depends=('vulkan-icd-loader' 'libgl' 'libegl' 'obs-studio>=27')
makedepends=('gcc' 'cmake' 'vulkan-headers' 'lib32-gcc-libs' 'lib32-vulkan-icd-loader' 'lib32-libgl' 'lib32-libegl')
source=("https://github.com/nowrep/$pkgbase/archive/v$pkgver/$pkgbase-$pkgver.tar.gz")
sha512sums=('656a0b1b0b59002b9688a7876412747f3af00637b140728be01c43b0bfd6ea6ae26d95ef0313e2a8e159102a4a0068a1a9b4730672ef99abb4362b8b1bf1a2a9')

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
