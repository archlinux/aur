# Maintainer: username227 <gfrank227 [at] gmail [dot] com>
# Contributor: Alexandre Bouvier <contact@amb.tf>
pkgname=shadps4
pkgver=0.4.0
pkgrel=2
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
	'zlib'
	'zlib-ng>=2.1.7'
	'zycore-c' # 'zydis>=5'
)
optdepends=(
	'renderdoc: for graphics debugging'
	'vulkan-validation-layers: for vulkan debugging'
)
provides=("$pkgname=$pkgver")
conflicts=("$pkgname-git")
source=(
	"$pkgname::git+https://github.com/shadps4-emu/shadPS4.git#tag=v.${pkgver}"
	"$pkgname-discord-rpc::git+https://github.com/shadps4-emu/ext-discord-rpc.git"
	"$pkgname-imgui::git+https://github.com/shadps4-emu/ext-imgui.git"
	"$pkgname-libatrac9::git+https://github.com/shadps4-emu/ext-LibAtrac9.git"
	"$pkgname-sirit::git+https://github.com/shadps4-emu/sirit.git"
	"$pkgname-tracy::git+https://github.com/shadps4-emu/tracy.git"
	"libpng::git+https://github.com/pnggroup/libpng.git"
	"zydis::git+https://github.com/zyantific/zydis.git"
	"git+https://github.com/KhronosGroup/glslang.git"
)
b2sums=('1fc08bc3a73c306e0bb87bd8f255ceb54e28b30fd20e29a276acf43fc4d7a351227b43f0ab78d0d8cd63eea90441a7f4f539c9ead2ab9129a780172b8051c67d'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

prepare() {
	cd $pkgname
	git config submodule.externals/dear_imgui.url ../$pkgname-imgui
	git config submodule.externals/discord-rpc.url ../$pkgname-discord-rpc
	git config submodule.externals/LibAtrac9.url ../$pkgname-libatrac9
	git config submodule.externals/libpng.url ../libpng
	git config submodule.externals/sirit.url ../$pkgname-sirit
	git config submodule.externals/tracy.url ../$pkgname-tracy
	git config submodule.externals/zydis.url ../zydis
	git config submodule.externals/glslang.url ../glslang
	git -c protocol.file.allow=always submodule update
	sed -i '/\/zlib-ng/d' externals/CMakeLists.txt
}

build() {
	cmake -B build -S $pkgname \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_C_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_SKIP_INSTALL_RPATH=ON \
		-DENABLE_QT_GUI=ON \
		-DENABLE_UPDATER=OFF \
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
		'libz.so'
		# 'libZydis.so'
		'qt6-base'
		'qt6-multimedia'
	)
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
}
