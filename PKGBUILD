# Maintainer: username227 <gfrank227 [at] gmail [dot] com>
# Contributor: Alexandre Bouvier <contact@amb.tf>
pkgname=shadps4
pkgver=0.10.0
_pkgname=shadPS4
pkgrel=2
pkgdesc="Sony PlayStation 4 emulator"
arch=('aarch64' 'x86_64')
url="https://shadps4.net/"
license=('GPL-2.0-or-later')
depends=(
	'crypto++>=8.9'
	'gcc-libs'
	'glibc'
	'glslang>=15'
	'hicolor-icon-theme'
	'pugixml>=1.14'
	'sdl3>=3.1.8'
)
makedepends=(
	'boost>=1.84'
	'cmake>=3.16.3'
	'ffmpeg'
	'fmt>=10.2'
	'git'
	'half>=1.12'
	'libpng>=1.6'
	'libusb>=1.0.27'
	'magic_enum>=0.9.7'
	'qt6-base'
	'qt6-multimedia'
	'qt6-tools'
	'rapidjson'
	'renderdoc'
	'robin-map>=1.3'
	'spirv-headers'
	'toml11>=4.2'
	'vulkan-headers>=1:1.4.314'
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
conflicts=("$pkgname-git")
options=("!debug")
source=(
	"git+https://github.com/shadps4-emu/shadPS4.git#tag=v.${pkgver}"
	"git+https://github.com/zyantific/zydis.git"
	"git+https://github.com/shadps4-emu/sirit.git"
	"git+https://github.com/shadps4-emu/tracy.git"
	"git+https://github.com/shadps4-emu/ext-imgui.git"
	"git+https://github.com/shadps4-emu/ext-discord-rpc.git"
	"git+https://github.com/shadps4-emu/ext-LibAtrac9.git"
)
b2sums=('a379a021861c2e87690f9993ac3e6b8951eb712bc18f8dbb14d002a695f70df6414ca819aaafcc334ddb554d4c80417cbfe22a31a9beb6d00a398f5d7eec41b3'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

prepare() {
    cd "$_pkgname"
	git config submodule.externals/dear_imgui.url "../ext-imgui"
	git config submodule.externals/discord-rpc.url "../ext-discord-rpc"
	git config submodule.externals/LibAtrac9.url "../ext-LibAtrac9"
	git config submodule.externals/sirit.url "../sirit"
	git config submodule.externals/tracy.url "../tracy"
	git config submodule.externals/zydis.url "../zydis"
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
		'libpng16.so'
		'libswresample.so'
		'libswscale.so'
		'libusb-1.0.so'
		'libuuid.so'
		'libxxhash.so'
		'libz.so'
		'qt6-base'
		'qt6-multimedia')
	DESTDIR="$pkgdir" cmake --install build
}
