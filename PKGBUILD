# Maintainer: éclairevoyant

pkgname=s2geometry
pkgver=0.10.0
pkgrel=1
pkgdesc="A library for manipulating geometric shapes"
arch=("x86_64" "aarch64")
url="https://s2geometry.io/"
license=(Apache)
depends=(abseil-cpp gcc-libs openssl)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::https://github.com/google/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
        0007-Fix-DCMAKE_CXX_STANDARD-ignored-by-CMakeLists-273.patch)
b2sums=('c5beef41f0d7a68be2242901d58107dfb303ddce7ab5cc0cd292cc20affdcca5fc0c7fdec2282861f62c3dc3577b2fb5ebc83bb33ae56da7e5d3e9a3e9127c10'
        '64bc0593be906d7c56bccc669f898bf4d79797b7239e08d04deb133ebb2fe86a798ab725c796f21bce0ba85d14aa1cc27c32f4507fe81c7040105bae374d3072')

prepare() {
	cd $pkgname-$pkgver
	patch -Np1 -i ../0007-Fix-DCMAKE_CXX_STANDARD-ignored-by-CMakeLists-273.patch
}

build() {
	cmake -B build -S $pkgname-$pkgver \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DCMAKE_CXX_STANDARD=17 # use the same C++ standard as abseil-cpp
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir/" install
}
