# Maintainer: Manuel Hüsers <aur@huesers.de>

pkgbase=obs-vkcapture
pkgname=("$pkgbase" "lib32-$pkgbase")
pkgver=1.5.1
pkgrel=1
url="https://github.com/nowrep/$pkgbase"
license=('GPL-2.0-or-later')
arch=('x86_64')
depends=('vulkan-icd-loader' 'libgl' 'libegl' 'obs-studio>=27')
makedepends=('gcc' 'cmake' 'vulkan-headers' 'lib32-gcc-libs' 'lib32-vulkan-icd-loader' 'lib32-libgl' 'lib32-libegl')
source=("https://github.com/nowrep/$pkgbase/archive/v$pkgver/$pkgbase-$pkgver.tar.gz")
sha512sums=('9477fd738cdf80e09aad46e58ee5e325aa4f5ae72fbe1cb22918d4910fd997ba2a012ce7ca3b24b1b3734983b94e9b7df391f3deca569a79c90c5d115a1a5eed')

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
