# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=rpcsx
pkgname=$_pkgname-git
pkgver=r18656.e27926d
pkgrel=1
pkgdesc="Sony PlayStation 4/5 emulator"
arch=('x86_64')
url="https://rpcsx.github.io/"
license=('GPL-2.0-only')
depends=(
	'gcc-libs'
	'glfw'
	'glibc'
)
makedepends=(
	'alsa-lib'
	'cmake'
	'curl'
	'flatbuffers'
	'git'
	'libpng'
	'libunwind'
	'libusb'
	'nasm'
	'nlohmann-json'
	'opencv'
	'pugixml'
	'python'
	'sox'
	'vulkan-headers'
	'vulkan-icd-loader'
	'wolfssl'
	'zlib'
)
optdepends=('vulkan-validation-layers: for rpcsx --validate')
provides=("$_pkgname=${pkgver#r}")
conflicts=("$_pkgname")
options=('!lto')
source=(
	"$_pkgname::git+https://github.com/RPCSX/rpcsx.git"
	"$_pkgname-libatrac9::git+https://github.com/RPCSX/LibAtrac9.git"
	"$_pkgname-spirv-tools::git+https://github.com/RPCSX/SPIRV-Tools.git"
	"$_pkgname-xbyak::git+https://github.com/RPCSX/xbyak.git"
	'asmjit::git+https://github.com/asmjit/asmjit.git'
	'cubeb::git+https://github.com/mozilla/cubeb.git'
	'ffmpeg::git+https://git.ffmpeg.org/ffmpeg.git'
	'fmt::git+https://github.com/fmtlib/fmt.git'
	'fusion::git+https://github.com/xioTechnologies/Fusion.git'
	'glslang::git+https://github.com/KhronosGroup/glslang.git'
	'miniupnp::git+https://github.com/miniupnp/miniupnp.git'
	'nlohmann-json::git+https://github.com/nlohmann/json.git'
	'rpcs3-hidapi::git+https://github.com/RPCS3/hidapi.git'
	'rpcs3-soundtouch::git+https://github.com/RPCS3/soundtouch.git'
	'rpcs3-yaml-cpp::git+https://github.com/RPCS3/yaml-cpp.git'
	'rtmidi::git+https://github.com/thestk/rtmidi.git'
	'spirv-cross::git+https://github.com/KhronosGroup/SPIRV-Cross.git'
	'spirv-headers::git+https://github.com/KhronosGroup/SPIRV-Headers.git'
	'vulkan-headers::git+https://github.com/KhronosGroup/Vulkan-Headers.git'
	'zstd::git+https://github.com/facebook/zstd.git'
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
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd $_pkgname
	git config submodule.3rdparty/FFmpeg.url ../ffmpeg
	git config submodule.3rdparty/fmtlib.url ../fmt
	git config submodule.3rdparty/glslang.url ../glslang
	git config submodule.3rdparty/json.url ../nlohmann-json
	git config submodule.3rdparty/LibAtrac9.url ../$_pkgname-libatrac9
	git config submodule.3rdparty/SPIRV-Cross.url ../spirv-cross
	git config submodule.3rdparty/SPIRV-Headers.url ../spirv-headers
	git config submodule.3rdparty/SPIRV-Tools.url ../$_pkgname-spirv-tools
	git config submodule.3rdparty/Vulkan-Headers.url ../vulkan-headers
	git config submodule.3rdparty/xbyak.url ../$_pkgname-xbyak
	git config submodule.rpcs3/asmjit.url ../asmjit
	git config submodule.rpcs3/3rdparty/cubeb/cubeb.url ../cubeb
	git config submodule.rpcs3/3rdparty/fusion/fusion.url ../fusion
	git config submodule.rpcs3/3rdparty/hidapi.url ../rpcs3-hidapi
	git config submodule.rpcs3/3rdparty/miniupnp/miniupnp.url ../miniupnp
	git config submodule.rpcs3/3rdparty/rtmidi/rtmidi.url ../rtmidi
	git config submodule.rpcs3/3rdparty/SoundTouch/soundtouch.url ../rpcs3-soundtouch
	git config submodule.rpcs3/3rdparty/yaml-cpp.url ../rpcs3-yaml-cpp
	git config submodule.rpcs3/3rdparty/zstd/zstd.url ../zstd
	git -c protocol.file.allow=always submodule update
	sed -i '/USE_SYSTEM/s/OFF/ON/i' CMakeLists.txt
}

build() {
	local options=(
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_C_FLAGS_RELEASE="-DNDEBUG"
		# -D CMAKE_CXX_FLAGS_INIT="-Wp,-U_GLIBCXX_ASSERTIONS"
		-D CMAKE_CXX_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_INSTALL_PREFIX=/usr
		-D CMAKE_POLICY_VERSION_MINIMUM=3.5
		-D USE_NATIVE_INSTRUCTIONS=OFF
		-D USE_SYSTEM_CURL=ON
		-D USE_SYSTEM_FLATBUFFERS=ON
		-D USE_SYSTEM_LIBPNG=ON
		-D USE_SYSTEM_LIBUSB=ON
		-D USE_SYSTEM_OPENCV=ON
		-D USE_SYSTEM_PUGIXML=ON
		-D USE_SYSTEM_WOLFSSL=ON
		-D USE_SYSTEM_ZLIB=ON
		-Wno-dev
	)
	cmake "${options[@]}" -B build -S $_pkgname
	cmake --build build
}

package() {
	depends+=(
		'libasound.so'
		'libsox_ng.so'
		'libunwind-x86_64.so'
		'libvulkan.so'
	)
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
}
