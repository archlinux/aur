# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-ppsspp
pkgname=$_pkgname-git
pkgver=1.12.3.r374.g4b5d703e0
pkgrel=1
pkgdesc="Sony PlayStation Portable core"
arch=('arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://www.ppsspp.org/"
license=('GPL2')
groups=('libretro')
depends=(
	'ffmpeg'
	'glew'
	'glslang'
	'libretro-core-info'
	'snappy'
)
makedepends=(
	'cmake'
	'git'
	'libpng'
	'libzip'
	'miniupnpc'
	'ninja'
	'sdl2'
	'spirv-cross'
	'zstd'
)
optdepends=('ppsspp-assets')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	'git+https://github.com/hrydgard/ppsspp.git'
	'git+https://github.com/Kingcom/armips.git'
)
b2sums=(
	'SKIP'
	'SKIP'
)

pkgver() {
	cd ppsspp
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd ppsspp
	git submodule init ext/armips
	git config submodule.ext/armips.url ../armips
	git submodule update
	# unbundle glslang
	rmdir ext/glslang
	ln -s /usr/include/glslang ext/glslang
	sed -i '/glslang/d' ext/CMakeLists.txt
	# unbundle miniupnpc
	sed -i 's|ext/miniupnp/||' Core/Util/PortManager.h
	# unbundle spirv-cross
	rmdir ext/SPIRV-Cross
	ln -s /usr/include/spirv_cross ext/SPIRV-Cross
	sed -i '/SPIRV-Cross-build/d' ext/CMakeLists.txt
	sed -i 's/spirv-cross-glsl/& spirv-cross-core/' CMakeLists.txt
}

build() {
	cmake -S ppsspp -B build -G Ninja \
		-DCMAKE_BUILD_TYPE=None \
		-DLIBRETRO=ON \
		-DUSE_SYSTEM_FFMPEG=ON \
		-DUSE_SYSTEM_LIBPNG=ON \
		-DUSE_SYSTEM_LIBSDL2=ON \
		-DUSE_SYSTEM_LIBZIP=ON \
		-DUSE_SYSTEM_MINIUPNPC=ON \
		-DUSE_SYSTEM_SNAPPY=ON \
		-DUSE_SYSTEM_ZSTD=ON \
		-Wno-dev
	cmake --build build
}

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro build/lib/ppsspp_libretro.so
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname ppsspp/LICENSE.TXT
}
