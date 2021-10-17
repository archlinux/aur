# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-ppsspp
pkgname=$_pkgname-git
pkgver=1.12.2.r9.g11b65ca22
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
	'git+https://github.com/miniupnp/miniupnp.git'
)
b2sums=(
	'SKIP'
	'SKIP'
	'SKIP'
)

pkgver() {
	cd ppsspp
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd ppsspp
	git submodule init ext/{armips,miniupnp}
	git config submodule.ext/armips.url ../armips
	git config submodule.ext/miniupnp.url ../miniupnp
	git submodule update
	# unbundle glslang
	rmdir ext/glslang
	ln -s /usr/include/glslang ext/glslang
	sed -i '/glslang/d' ext/CMakeLists.txt
	# unbundle spirv-cross
	rmdir ext/SPIRV-Cross
	ln -s /usr/include/spirv_cross ext/SPIRV-Cross
	sed -i '/SPIRV-Cross-build/d' ext/CMakeLists.txt
	sed -i 's/spirv-cross-glsl/& spirv-cross-core/' CMakeLists.txt
	# unbundle zstd
	sed -i '/zstd/d' ext/CMakeLists.txt
	sed -i 's/libzstd_static/zstd/' CMakeLists.txt
}

build() {
	cmake -S ppsspp -B build -G Ninja \
		-DCMAKE_BUILD_TYPE=None \
		-DLIBRETRO=ON \
		-DUSE_SYSTEM_FFMPEG=ON \
		-DUSE_SYSTEM_LIBPNG=ON \
		-DUSE_SYSTEM_LIBSDL2=ON \
		-DUSE_SYSTEM_LIBZIP=ON \
		-DUSE_SYSTEM_SNAPPY=ON \
		-Wno-dev
	cmake --build build
}

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro build/lib/ppsspp_libretro.so
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname ppsspp/LICENSE.TXT
}
