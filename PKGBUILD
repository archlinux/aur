# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=shadps4
pkgname=$_pkgname-git
pkgver=0.2.0.r204.gcf706f8c
pkgrel=1
pkgdesc="Sony PlayStation 4 emulator"
arch=('x86_64')
url="https://shadps4.net/"
license=('GPL-2.0-or-later')
depends=(
	'bash'
	'crypto++>=8.9'
	'gcc-libs'
	'glibc'
	'glslang>=14.2'
	'hicolor-icon-theme'
	'sdl3>=1:3.0.0.r5890'
	'zlib-ng>=2.1.7'
)
makedepends=(
	# 'boost>=1.84'
	'cmake>=3.16.3'
	'ffmpeg'
	'fmt>=10.2'
	'git'
	'magic_enum>=0.9.6'
	'qt6-base'
	'qt6-tools'
	'rapidjson'
	'renderdoc'
	'robin-map>=1.3'
	'spirv-headers'
	'toml11>=4.2'
	'vulkan-headers>=1:1.3.289'
	'vulkan-memory-allocator>=3.1'
	'xbyak>=7.07'
	'xxhash>=0.8.2'
	'zycore-c' # 'zydis>=5'
)
optdepends=(
	'renderdoc: for graphics debugging'
	'vulkan-validation-layers: for vulkan debugging'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=(
	"$_pkgname::git+https://github.com/shadps4-emu/shadPS4.git"
	"$_pkgname-boost::git+https://github.com/shadps4-emu/ext-boost.git"
	"$_pkgname-sirit::git+https://github.com/shadps4-emu/sirit.git"
	"$_pkgname-tracy::git+https://github.com/shadps4-emu/tracy.git"
	"zydis::git+https://github.com/zyantific/zydis.git"
	"$_pkgname.sh"
)
b2sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'03abf49a4be0a1308baa2a8d6abe9e4d8cbd5e3fb5b87855d6466f7b21892382fd9e2d574c96cd52bb64f8a529725a3ef3e2994ed5e477be8a25b69052c38483'
)

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v\.\?//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $_pkgname
	git config submodule.externals/ext-boost.url ../$_pkgname-boost
	git config submodule.externals/sirit.url ../$_pkgname-sirit
	git config submodule.externals/tracy.url ../$_pkgname-tracy
	git config submodule.externals/zydis.url ../zydis
	git -c protocol.file.allow=always submodule update
}

build() {
	cmake -B build -S $_pkgname \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_C_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_DISABLE_FIND_PACKAGE_Boost=ON \
		-DCMAKE_DISABLE_FIND_PACKAGE_Zydis=ON \
		-DENABLE_QT_GUI=ON \
		-DSIRIT_USE_SYSTEM_SPIRV_HEADERS=ON \
		-Wno-dev
	cmake --build build
}

package() {
	depends+=(
		'libavcodec.so'
		'libavformat.so'
		'libavutil.so'
		'libfmt.so'
		'libswresample.so'
		'libswscale.so'
		'libxxhash.so'
		# 'libZydis.so'
		'qt6-base'
	)
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/$_pkgname build/shadps4
	install -D $_pkgname.sh "$pkgdir"/usr/bin/shadps4
	cd $_pkgname
	install -Dm644 -t "$pkgdir"/usr/share/icons/hicolor/512x512/apps .github/shadps4.png
	install -Dm644 -t "$pkgdir"/usr/share/applications .github/shadps4.desktop
}
