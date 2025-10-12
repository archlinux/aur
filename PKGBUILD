# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=shadps4
pkgname=$_pkgname-git
pkgver=0.11.0.r63.g6b6294a
pkgrel=1
pkgdesc="Sony PlayStation 4 emulator"
arch=('aarch64' 'x86_64')
url="https://shadps4.net/"
license=('GPL-2.0-or-later')
depends=(
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
	'ffmpeg>=2:5.1.2'
	'fmt>=10.2'
	'git'
	'half>=1.12'
	'libpng>=1.6'
	'magic_enum>=0.9.7'
	'qt6-base'
	'qt6-multimedia'
	'qt6-tools'
	'rapidjson'
	'renderdoc'
	'robin-map>=1.3'
	'spirv-headers'
	'stb'
	'systemd-libs'
	'toml11>=4.2'
	'util-linux-libs'
	'vulkan-headers>=1:1.4.324'
	'vulkan-memory-allocator>=3.1'
	'xbyak>=7.07'
	'xxhash>=0.8.2'
	'zlib'
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
	"$_pkgname-hwinfo::git+https://github.com/shadps4-emu/ext-hwinfo.git"
	"$_pkgname-imgui::git+https://github.com/shadps4-emu/ext-imgui.git"
	"$_pkgname-libatrac9::git+https://github.com/shadps4-emu/ext-LibAtrac9.git"
	"$_pkgname-libusb::git+https://github.com/shadps4-emu/ext-libusb.git"
	"$_pkgname-sirit::git+https://github.com/shadps4-emu/sirit.git"
	"$_pkgname-tracy::git+https://github.com/shadps4-emu/tracy.git"
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
	'SKIP'
	'SKIP'
)

pkgver() {
	cd $_pkgname
	git describe --long --abbrev=7 | sed 's/^v\.\?//;s/[^-]*-g/r&/;s/-/./g'
}

prepare() {
	cd $_pkgname
	git config submodule.externals/dear_imgui.url ../$_pkgname-imgui
	git config submodule.externals/discord-rpc.url ../$_pkgname-discord-rpc
	git config submodule.externals/ext-libusb.url ../$_pkgname-libusb
	git config submodule.externals/hwinfo.url ../$_pkgname-hwinfo
	git config submodule.externals/LibAtrac9.url ../$_pkgname-libatrac9
	git config submodule.externals/sirit.url ../$_pkgname-sirit
	git config submodule.externals/tracy.url ../$_pkgname-tracy
	git config submodule.externals/zydis.url ../zydis
	git -c protocol.file.allow=always submodule update
	# remove hardcoded flag
	sed -i '/-march=/d' CMakeLists.txt
	# use system glslang
	sed -i '/find_package/s/glslang 15/glslang/' CMakeLists.txt
}

build() {
	local options=(
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_C_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_CXX_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_INSTALL_PREFIX=/usr
		-D CMAKE_SKIP_INSTALL_RPATH=ON
		-D ENABLE_QT_GUI=ON
		-D ENABLE_UPDATER=OFF
		-D SIRIT_USE_SYSTEM_SPIRV_HEADERS=ON
		-Wno-dev
	)
	cmake "${options[@]}" -B build -S $_pkgname
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
		'libudev.so'
		'libuuid.so'
		'libxxhash.so'
		'libz.so'
		# 'libZydis.so'
		'qt6-base'
		'qt6-multimedia'
	)
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
}
