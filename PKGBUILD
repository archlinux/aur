# Maintainer: Alexandre Bouvier <contact@amb.tf>
_reponame=ppsspp
_pkgname=libretro-$_reponame
pkgname=$_pkgname-git
pkgver=1.12.3.r980.g3bfab6326
pkgrel=2
pkgdesc="Sony PlayStation Portable core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://www.ppsspp.org/"
license=('GPL2')
groups=('libretro')
depends=(
	'ffmpeg4.4' # https://github.com/hrydgard/ppsspp/issues/15308
	'glew'
	'glslang'
	'libretro-core-info'
	'miniupnpc'
	'snappy'
)
makedepends=(
	'cmake'
	'git'
	'libpng'
	'libzip'
	'spirv-cross'
	'zstd'
)
optdepends=('ppsspp-assets')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$_reponame::git+https://github.com/hrydgard/ppsspp.git"
	'armips::git+https://github.com/Kingcom/armips.git'
)
b2sums=(
	'SKIP'
	'SKIP'
)

pkgver() {
	cd $_reponame
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $_reponame
	git config submodule.ext/armips.url ../armips
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
}

build() {
	export PKG_CONFIG_PATH=/usr/lib/ffmpeg4.4/pkgconfig
	cmake -S $_reponame -B build \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_SKIP_RPATH=ON \
		-DLIBRETRO=ON \
		-DUSE_SYSTEM_FFMPEG=ON \
		-DUSE_SYSTEM_LIBPNG=ON \
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
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_reponame/LICENSE.TXT
}
