# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=shadps4
pkgname=$_pkgname-git
pkgver=0.4.0.r9.gfe389e56
pkgrel=1
pkgdesc="Sony PlayStation 4 emulator"
arch=('aarch64' 'x86_64')
url="https://shadps4.net/"
license=('GPL-2.0-or-later')
depends=(
	'crypto++>=8.9'
	'gcc-libs'
	'glibc'
	'glslang>=14.2'
	'hicolor-icon-theme'
	'pugixml>=1.14'
	'sdl3>=1:3.1.3'
	'zlib-ng>=2.1.7'
)
makedepends=(
	'boost>=1.84'
	'cmake>=3.16.3'
	'ffmpeg'
	'fmt>=10.2'
	'git'
	'half>=1.12'
	'magic_enum>=0.9.6'
	'qt6-base'
	'qt6-multimedia'
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
	"$_pkgname-discord-rpc::git+https://github.com/shadps4-emu/ext-discord-rpc.git"
	"$_pkgname-imgui::git+https://github.com/shadps4-emu/ext-imgui.git"
	"$_pkgname-sirit::git+https://github.com/shadps4-emu/sirit.git"
	"$_pkgname-tracy::git+https://github.com/shadps4-emu/tracy.git"
	"vita3k-libatrac9::git+https://github.com/Vita3K/LibAtrac9.git"
	"zydis::git+https://github.com/zyantific/zydis.git"
)
b2sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)

pkgver() {
	cd $_pkgname
	git describe --long | sed 's/^v\.\?//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $_pkgname
	git config submodule.externals/dear_imgui.url ../$_pkgname-imgui
	git config submodule.externals/discord-rpc.url ../$_pkgname-discord-rpc
	git config submodule.externals/LibAtrac9.url ../vita3k-libatrac9
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
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_SKIP_INSTALL_RPATH=ON \
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
		'qt6-multimedia'
	)
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
}
