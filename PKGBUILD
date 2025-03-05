# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=azahar
pkgname=$_pkgname-git
pkgver=r10321.56e96dea6
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
	'dynarmic'
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
	'xbyak'
	'zstd'
)
provides=("$_pkgname=${pkgver#r}")
conflicts=("$_pkgname" "citra")
source=(
	"$_pkgname::git+https://github.com/azahar-emu/azahar.git"
	"$_pkgname-boost::git+https://github.com/azahar-emu/ext-boost.git"
	"$_pkgname-compatibility-list::git+https://github.com/azahar-emu/compatibility-list.git"
	"$_pkgname-discord-rpc::git+https://github.com/azahar-emu/discord-rpc.git"
	"$_pkgname-sirit::git+https://github.com/azahar-emu/sirit.git"
	"dds-ktx::git+https://github.com/septag/dds-ktx.git"
	"faad2::git+https://github.com/knik0/faad2.git"
	"lodepng::git+https://github.com/lvandeve/lodepng.git"
	"nihstro::git+https://github.com/neobrain/nihstro.git"
	"soundtouch::git+https://codeberg.org/soundtouch/soundtouch.git"
	"teakra::git+https://github.com/wwylele/teakra.git"
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
)

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $_pkgname
	git config submodule.boost.url ../$_pkgname-boost
	git config submodule.compatibility-list.url ../$_pkgname-compatibility-list
	git config submodule.dds-ktx.url ../dds-ktx
	git config submodule.discord-rpc.url ../$_pkgname-discord-rpc
	git config submodule.faad2.url ../faad2
	git config submodule.lodepng.url ../lodepng
	git config submodule.nihstro.url ../nihstro
	git config submodule.sirit.url ../$_pkgname-sirit
	git config submodule.soundtouch.url ../soundtouch
	git config submodule.teakra.url ../teakra
	git -c protocol.file.allow=always submodule update
	mkdir -p ../build
	ln -sr .git ../build
	sed -i '/check_submodules_present()/d' CMakeLists.txt
	sed -i '/FORTIFY_SOURCE/d' src/CMakeLists.txt
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
		-D DISABLE_SYSTEM_LODEPNG=ON
		-D DISABLE_SYSTEM_SOUNDTOUCH=ON
		-D ENABLE_LTO=OFF
		-D ENABLE_QT_TRANSLATION=ON
		-D ENABLE_QT_UPDATER=OFF
		-D ENABLE_TESTS="$CHECKFUNC"
		-D SIRIT_USE_SYSTEM_SPIRV_HEADERS=ON
		-D USE_DISCORD_PRESENCE=ON
		-D USE_SYSTEM_LIBS=ON
		-Wno-dev
	)
	cmake "${options[@]}" -B build -S $_pkgname
	cmake --build build
}

check() {
	ctest --output-on-failure --test-dir build
}

package() {
	depends+=(
		'libbacktrace.so'
		'libcrypto.so'
		'libcubeb.so'
		'libdynarmic.so'
		'libfmt.so'
		'libopenal.so'
		'libssl.so'
		'libusb-1.0.so'
		'libzstd.so'
	)
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
}
