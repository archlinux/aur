# Maintainer: Alexandre Bouvier <contact@amb.tf>
pkgname=yuzu
pkgver=mainline.0.697
pkgrel=1
pkgdesc="Nintendo Switch emulator"
arch=('x86_64')
url="https://yuzu-emu.org/"
license=('GPL2')
depends=('cubeb' 'qt5-webengine>=5.12')
makedepends=(
	'boost>=1.73'
	'catch2>=2.13'
	'cmake>=3.15'
	'cpp-httplib-compiled>=0.9.1'
	'discord-rpc'
	'ffmpeg'
	'fmt>=8.0'
	'git'
	'glslang'
	'libinih>=52'
	'libusb>=1.0.24'
	'libzip>=1.5'
	'lz4>=1.8'
	'ninja'
	'nlohmann-json>=3.8'
	'opus>=1.3'
	'qt5-tools>=5.12'
	'sdl2>=2.0.14'
	'spirv-headers>=1.3.7' # for sirit
	'vulkan-headers>=1.2.145'
	'xbyak>=5.96'
	'zlib>=1.2'
	'zstd>=1.5'
)
source=(
	"git+https://github.com/yuzu-emu/yuzu-mainline.git#tag=${pkgver//./-}"
	'git+https://github.com/MerryMage/dynarmic.git'
	'yuzu-mbedtls::git+https://github.com/yuzu-emu/mbedtls.git'
	'git+https://github.com/ReinUsesLisp/sirit.git'
	'citra-soundtouch::git+https://github.com/citra-emu/ext-soundtouch.git'
	'unbundle-cubeb.patch'
	'unbundle-discord-rpc.patch'
	'unbundle-httplib.patch'
	'unbundle-inih.patch'
	'unbundle-sdl.patch'
	'unbundle-spirv-headers.patch'
	'unbundle-vulkan-headers.patch'
	'unbundle-xbyak.patch'
)
md5sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'08f8ade46d02e693029b4595e0ecebc9'
	'9f349a6d997b0889d00319a5e4733062'
	'dd2afd63ac4448dffd380cfba6acc57c'
	'56f414ef28a7e880a16ea6b114cad35b'
	'd84ac7b61105c2a1ca667706516ba9b9'
	'374366419df7293779295a6c800b99b5'
	'5d83e211eb2ce207e5a4c739772a6b10'
	'7654bb89d5febcdfcee9d3b88bdec4c3'
)

prepare() {
	cd yuzu-mainline
	git submodule init externals/{dynarmic,mbedtls,sirit,soundtouch}
	git config submodule.dynarmic.url ../dynarmic
	git config submodule.mbedtls.url ../yuzu-mbedtls
	git config submodule.sirit.url ../sirit
	git config submodule.soundtouch.url ../citra-soundtouch
	git submodule update
	patch -Np1 < ../unbundle-cubeb.patch
	patch -Np1 < ../unbundle-discord-rpc.patch
	patch -Np1 < ../unbundle-httplib.patch
	patch -Np1 < ../unbundle-inih.patch
	patch -Np1 < ../unbundle-sdl.patch
	patch -Np1 < ../unbundle-spirv-headers.patch
	patch -Np1 < ../unbundle-vulkan-headers.patch
	patch -Np1 < ../unbundle-xbyak.patch
	rm .gitmodules
}

build() {
	cmake -S yuzu-mainline -B build -G Ninja \
		-DBUILD_REPOSITORY=yuzu-emu/yuzu-mainline \
		-DBUILD_TAG=${pkgver/.0./-} \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DDISPLAY_VERSION=${pkgver##*.} \
		-DENABLE_COMPATIBILITY_LIST_DOWNLOAD=ON \
		-DENABLE_QT_TRANSLATION=ON \
		-DTITLE_BAR_FORMAT_IDLE="yuzu {}" \
		-DTITLE_BAR_FORMAT_RUNNING="yuzu {} | {}" \
		-DUSE_DISCORD_PRESENCE=ON \
		-DYUZU_ENABLE_COMPATIBILITY_REPORTING=ON \
		-DYUZU_USE_BUNDLED_BOOST=OFF \
		-DYUZU_USE_BUNDLED_FFMPEG=OFF \
		-DYUZU_USE_BUNDLED_LIBUSB=OFF \
		-DYUZU_USE_BUNDLED_QT=OFF \
		-DYUZU_USE_BUNDLED_SDL2=OFF \
		-DYUZU_USE_EXTERNAL_SDL2=OFF \
		-DYUZU_USE_QT_WEB_ENGINE=ON \
		-Wno-dev
	cmake --build build
}

check() {
	ninja -C build test
}

package() {
	depends+=(
		'libavcodec.so'
		'libavutil.so'
		'libboost_context.so'
		'libdiscord-rpc.so'
		'libfmt.so'
		'libhttplib.so'
		'libINIReader.so'
		'libswscale.so'
		'libusb-1.0.so'
		'libzip.so'
		'libzstd.so'
	)
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
}
