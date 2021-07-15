# Maintainer: Alexandre Bouvier <contact@amb.tf>
pkgname=yuzu
pkgver=mainline.0.687
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
	'cpp-httplib'
	'ffmpeg'
	'fmt>=8.0'
	'git'
	'glslang'
	'libinih'
	'libusb>=1.0.24'
	'libzip>=1.5'
	'lz4>=1.8'
	'ninja'
	'nlohmann-json>=3.8'
	'openssl>=1.1'
	'opus>=1.3'
	'qt5-tools>=5.12'
	'rapidjson>=1.1' # for discord-rpc
	'sdl2>=2.0.14'
	'spirv-headers'  # for sirit
	'vulkan-headers'
	'xbyak'
	'zlib>=1.2'
	'zstd>=1.5'
)
source=(
	"git+https://github.com/yuzu-emu/yuzu-mainline.git#tag=${pkgver//./-}"
	'git+https://github.com/discord/discord-rpc.git'
	'git+https://github.com/MerryMage/dynarmic.git'
	'yuzu-mbedtls::git+https://github.com/yuzu-emu/mbedtls.git'
	'git+https://github.com/ReinUsesLisp/sirit.git'
	'citra-soundtouch::git+https://github.com/citra-emu/ext-soundtouch.git'
	'unbundle-cubeb.patch'
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
	'SKIP'
	'2ffaa5563dd3e97e9c0bf623561f5ee8'
	'd710c3b4366e73276b2466101bb4aac1'
	'63fe5690931ab15c788acef299658176'
	'58933c558489f6b66adfc50ba6d78dbc'
	'5171e9a5b9098212c1375d734bf48b41'
	'1052de01d7e9bb2153db7c41805b6fea'
)

prepare() {
	cd yuzu-mainline
	git submodule init externals/{discord-rpc,dynarmic,mbedtls,sirit,soundtouch}
	git config submodule.discord-rpc.url ../discord-rpc
	git config submodule.dynarmic.url ../dynarmic
	git config submodule.mbedtls.url ../yuzu-mbedtls
	git config submodule.sirit.url ../sirit
	git config submodule.soundtouch.url ../citra-soundtouch
	git submodule update
	patch -Np1 < ../unbundle-cubeb.patch
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
		-DYUZU_ALLOW_SYSTEM_SDL2=ON \
		-DYUZU_ENABLE_COMPATIBILITY_REPORTING=ON \
		-DYUZU_USE_BUNDLED_BOOST=OFF \
		-DYUZU_USE_BUNDLED_FFMPEG=OFF \
		-DYUZU_USE_BUNDLED_LIBUSB=OFF \
		-DYUZU_USE_BUNDLED_QT=OFF \
		-DYUZU_USE_BUNDLED_SDL2=OFF \
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
		'libfmt.so'
		'libINIReader.so'
		'libswscale.so'
		'libusb-1.0.so'
		'libzip.so'
		'libzstd.so'
	)
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
}
