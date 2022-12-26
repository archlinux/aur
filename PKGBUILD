# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-lrps2
pkgname=$_pkgname-git
pkgver=r12800.fa3f48a2e
pkgrel=1
pkgdesc="Sony PlayStation 2 core"
arch=('x86_64')
url="https://github.com/libretro/LRPS2"
license=('LGPL3')
groups=('libretro')
depends=('libaio' 'libchdr' 'libgl' 'libretro-core-info' 'yaml-cpp')
makedepends=('cmake' 'git' 'xxd')
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=('libretro-pcsx2-git')
options=('!lto') # https://github.com/libretro/LRPS2/issues/180
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $_pkgname
	# remove ccache
	sed -i '/ccache/d' CMakeLists.txt
	# unbundle libchdr
	sed -i '/libchdr/d' cmake/SearchForStuff.cmake
	sed -i 's/chdr-static/chdr/' common/src/Utilities/CMakeLists.txt
	# unbundle yaml-cpp
	sed -i '/yaml-cpp/d' cmake/SearchForStuff.cmake
}

build() {
	cmake -S $_pkgname -B build \
		-DARCH_FLAG="" \
		-DCMAKE_BUILD_TYPE=Release \
		-DDISABLE_ADVANCE_SIMD=ON \
		-DLIBRETRO=ON \
		-DOPTIMIZATION_FLAG="" \
		-DUSE_LTO=OFF \
		-Wno-dev
	cmake --build build
}

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro build/pcsx2/pcsx2_libretro.so
}
