# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=azahar
pkgname=$_pkgname-git
pkgver=2120.rc1.r56.g5ade69f5f
pkgrel=1
pkgdesc="Nintendo 3DS emulator based on Citra"
arch=('x86_64')
url="https://azahar-emu.org/"
license=('GPL-2.0-or-later')
depends=(
	'crypto++'
	'enet'
	'gcc-libs'
	'glibc'
	'glslang'
	'hicolor-icon-theme'
	'qt6-base'
	'qt6-multimedia'
	'sdl2'
)
makedepends=(
	'catch2'
	'cmake'
	'cpp-jwt'
	'cubeb'
	'ffmpeg4.4'
	'fmt'
	'git'
	'libbacktrace'
	'libinih'
	'libusb'
	'nlohmann-json'
	'openal'
	'openssl'
	'qt6-tools'
	'rapidjson'
	'robin-map'
	'spirv-headers'
	'vulkan-headers'
	'vulkan-memory-allocator'
	'zstd'
	'zydis'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=(
	"$_pkgname::git+https://github.com/azahar-emu/azahar.git"
	"$_pkgname-boost::git+https://github.com/azahar-emu/ext-boost.git"
	"$_pkgname-compatibility-list::git+https://github.com/azahar-emu/compatibility-list.git"
	"$_pkgname-discord-rpc::git+https://github.com/azahar-emu/discord-rpc.git"
	"$_pkgname-dynarmic::git+https://github.com/azahar-emu/dynarmic.git"
	"$_pkgname-mcl::git+https://github.com/azahar-emu/mcl.git"
	"$_pkgname-sirit::git+https://github.com/azahar-emu/sirit.git"
	"$_pkgname-soundtouch::git+https://github.com/azahar-emu/soundtouch.git"
	"dds-ktx::git+https://github.com/septag/dds-ktx.git"
	"faad2::git+https://github.com/knik0/faad2.git"
	"lodepng::git+https://github.com/lvandeve/lodepng.git"
	"nihstro::git+https://github.com/neobrain/nihstro.git"
	"teakra::git+https://github.com/wwylele/teakra.git"
	"xbyak::git+https://github.com/herumi/xbyak.git"
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
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $_pkgname
	git config submodule.boost.url ../$_pkgname-boost
	git config submodule.compatibility-list.url ../$_pkgname-compatibility-list
	git config submodule.dds-ktx.url ../dds-ktx
	git config submodule.discord-rpc.url ../$_pkgname-discord-rpc
	git config submodule.dynarmic.url ../$_pkgname-dynarmic
	git config submodule.faad2.url ../faad2
	git config submodule.lodepng.url ../lodepng
	git config submodule.nihstro.url ../nihstro
	git config submodule.sirit.url ../$_pkgname-sirit
	git config submodule.soundtouch.url ../$_pkgname-soundtouch
	git config submodule.teakra.url ../teakra
	git config submodule.xbyak.url ../xbyak
	git -c protocol.file.allow=always submodule update
	cd externals/dynarmic
	git config submodule.mcl.url ../../../$_pkgname-mcl
	git -c protocol.file.allow=always submodule update
	# fix for missing submodules
	sed -i '/check_submodules_present()/d' ../../CMakeLists.txt
	# fix for cmake 4
	sed -i '/VERSION/s/3\.2\.0/3.5/' ../discord-rpc/CMakeLists.txt
}

build() {
	local options=(
		-D CITRA_USE_PRECOMPILED_HEADERS=OFF
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_C_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_CXX_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_INCLUDE_PATH="/usr/include/ffmpeg4.4"
		-D CMAKE_INSTALL_PREFIX=/usr
		-D DISABLE_SYSTEM_BOOST=ON
		-D DISABLE_SYSTEM_CPP_HTTPLIB=ON
		-D DISABLE_SYSTEM_DYNARMIC=ON
		-D DISABLE_SYSTEM_LODEPNG=ON
		-D DISABLE_SYSTEM_SOUNDTOUCH=ON
		-D DISABLE_SYSTEM_XBYAK=ON
		-D ENABLE_LTO=OFF
		-D ENABLE_QT_TRANSLATION=ON
		-D ENABLE_TESTS="$CHECKFUNC"
		-D SIRIT_USE_SYSTEM_SPIRV_HEADERS=ON
		-D USE_DISCORD_PRESENCE=ON
		-D USE_SYSTEM_LIBS=ON
		-Wno-dev
	)
	cd $_pkgname
	cmake "${options[@]}" -B build
	cmake --build build
}

check() {
	cd $_pkgname
	ctest --output-on-failure --test-dir build
}

package() {
	depends+=(
		'libbacktrace.so'
		'libcrypto.so'
		'libcubeb.so'
		'libfmt.so'
		'libopenal.so'
		'libssl.so'
		'libusb-1.0.so'
		'libzstd.so'
		'libZydis.so'
	)
	cd $_pkgname
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
}
