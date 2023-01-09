# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-lrps2
pkgname=$_pkgname-git
pkgver=r12920.3a80e0ff0
pkgrel=1
pkgdesc="Sony PlayStation 2 core"
arch=('x86_64')
url="https://github.com/libretro/LRPS2"
license=('GPL2' 'GPL3' 'LGPL3')
groups=('libretro')
depends=('libaio' 'libchdr' 'libretro-core-info' 'wxwidgets' 'yaml-cpp')
makedepends=('cmake' 'git' 'xxd')
provides=("$_pkgname=${pkgver#r}")
conflicts=("$_pkgname")
replaces=('libretro-pcsx2-git')
source=(
	"$_pkgname::git+$url.git"
	'fix-lto.patch'
	'use-system-libs.patch'
)
b2sums=(
	'SKIP'
	'eefc261919281854605e4c9bcab7e53389197650481a2aea693aa0848b874a532acf445231836759c5602c02e7160eb45cfe120d726882e234d6580fcbde12a4'
	'6e751daca841a899de11db7be1debf30a3dcd1bc4daeb1598bc467dff83fa113c2b6c4dd865a697c35b11d3d9a5622559c68e9462adbce97587a501cb4f34cb0'
)

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $_pkgname
	patch -Np1 < ../fix-lto.patch
	patch -Np1 < ../use-system-libs.patch
	sed -i '/ccache/d' CMakeLists.txt
}

build() {
	cmake -S $_pkgname -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DDISABLE_ADVANCE_SIMD=ON \
		-DOPTIMIZATION_FLAG="" \
		-Wno-dev
	cmake --build build
}

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro build/pcsx2/pcsx2_libretro.so
}
