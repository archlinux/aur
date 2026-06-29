# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=libretro-azahar
pkgver=2125.1.3
pkgrel=1
epoch=1
pkgdesc="An open-source 3DS emulator project based on Citra."
arch=('x86_64')
url="https://github.com/azahar-emu/azahar"
license=('GPL-2.0-or-later')
depends=('crypto++' 'soundtouch' 'fmt' 'libstdc++' 'libgcc' 'glibc' 'glslang' 'openssl' 'zydis' 'libretro-core-info' 'boost-libs' 'enet')
makedepends=('cmake' 'ninja' 'vulkan-headers' 'rapidjson' 'doxygen' 'graphviz' 'nlohmann-json' 'spirv-headers'
	     'catch2' 'libinih' 'ffmpeg4.4' 'boost')
source=("$url/releases/download/${pkgver}/azahar-unified-source-$pkgver.tar.xz")
sha256sums=('e26502b03e17c8a261dcb4809d41825508b27073c2b40f91be83fe3594245de0')

prepare() {
	cd "$srcdir/azahar-unified-source-$pkgver"

	#Fix cubeb
	sed -i '4i #include <cstring>' src/audio_core/{cubeb_input,cubeb_sink}.cpp

}

build() {
	cd "$srcdir"
	[[ $(grep -o sse4_2 /proc/cpuinfo | sed -n 1p) = sse4_2 ]] && local _SSE=ON && echo "SSE4.2 Enabled"
	cmake -B build -S "azahar-unified-source-$pkgver" -G Ninja \
	-DCMAKE_C_FLAGS="${CFLAGS} -DNDEBUG" \
	-DCMAKE_CXX_FLAGS="${CXXFLAGS} -DNDEBUG" \
	-DCMAKE_EXE_LINKER_FLAGS="$LDFLAGS" \
	-DCMAKE_SHARED_LINKER_FLAGS="$LDFLAGS" \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=None \
	-DUSE_DISCORD_PRESENCE=ON \
	-DUSE_SYSTEM_BOOST=ON \
	-DUSE_SYSTEM_CATCH2=ON \
	-DUSE_SYSTEM_CRYPTOPP=ON \
	-DUSE_SYSTEM_ENET=ON \
	-DUSE_SYSTEM_FFMPEG_HEADERS=ON \
	-DUSE_SYSTEM_FMT=ON \
	-DUSE_SYSTEM_GLSLANG=ON \
	-DUSE_SYSTEM_INIH=ON \
	-DUSE_SYSTEM_JSON=ON \
	-DUSE_SYSTEM_LIBUSB=ON \
	-DUSE_SYSTEM_OPENAL=ON \
	-DUSE_SYSTEM_OPENSSL=ON \
	-DUSE_SYSTEM_QT=ON \
	-DUSE_SYSTEM_SDL2=ON \
	-DUSE_SYSTEM_SOUNDTOUCH=ON \
	-DUSE_SYSTEM_VULKAN_HEADERS=ON \
	-DUSE_SYSTEM_ZSTD=OFF \
	-DCITRA_USE_PRECOMPILED_HEADERS=OFF \
	-DCMAKE_INCLUDE_PATH="/usr/include/ffmpeg4.4" \
	-DSIRIT_USE_SYSTEM_SPIRV_HEADERS=ON \
	-DENABLE_QT_TRANSLATION=ON \
	-DENABLE_SSE42=$_SSE \
	-DENABLE_LTO=OFF \
	-DENABLE_TESTS=OFF \
	-Wno-dev \
	-DENABLE_LIBRETRO=ON

	cmake --build build
}


package() {
	cd "$srcdir"
	#DESTDIR="$pkgdir" cmake --install build
	install -Dm755 build/bin/None/azahar_libretro.so -t "$pkgdir/usr/lib/libretro"
	install -Dm644 "$srcdir/azahar-unified-source-$pkgver/license.txt" "$pkgdir/usr/share/licenses/$pkgname/licenses.txt"
}
