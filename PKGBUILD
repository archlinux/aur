# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=azahar
pkgver=2121
pkgrel=1
epoch=1
pkgdesc="An open-source 3DS emulator project based on Citra."
arch=('x86_64')
url="https://github.com/azahar-emu/azahar"
license=('GPL-2.0-or-later')
depends=('glibc' 'gcc-libs' 'qt6-base' 'crypto++' 'fmt' 'glslang' 'libusb' 'openal' 'openssl' 'sdl2' 'soundtouch' 'zstd'
	 'qt6-multimedia' 'zydis' 'hicolor-icon-theme')
makedepends=('cmake' 'ninja' 'vulkan-headers' 'rapidjson' 'doxygen' 'graphviz' 'nlohmann-json' 'clang' 'lld' 'spirv-headers'
	     'catch2' 'libinih' 'ffmpeg4.4' 'qt6-tools')
options=(!lto)
source=("$url/releases/download/${pkgver}/$pkgname-unified-source-$pkgver.tar.xz")
sha256sums=('261281d9e1fe4e109314c66eaa43b76bb8892af8ef31a6e4f080f6a6fa6ecc98')

prepare() {
	cd "$srcdir/$pkgname-unified-source-$pkgver"
}

build() {
	cd "$srcdir"
	LDFLAGS="$LDFLAGS -fuse-ld=lld"
	cmake -B build -S "$pkgname-unified-source-$pkgver" -G Ninja \
	-DCMAKE_C_COMPILER=clang \
	-DCMAKE_CXX_COMPILER=clang++ \
	-DCMAKE_C_FLAGS="${CFLAGS} -flto=thin -DNDEBUG" \
	-DCMAKE_CXX_FLAGS="${CXXFLAGS} -flto=thin -DNDEBUG" \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=None \
	-DUSE_DISCORD_PRESENCE=ON \
	-DUSE_SYSTEM_BOOST=OFF \
	-DUSE_SYSTEM_CATCH2=ON \
	-DUSE_SYSTEM_CRYPTOPP=ON \
	-DUSE_SYSTEM_FFMPEG_HEADERS=ON \
	-DUSE_SYSTEM_FMT=ON \
	-DUSE_SYSTEM_GLSLANG=ON \
	-DUSE_SYSTEM_INIH=ON \
	-DUSE_SYSTEM_JSON=ON \
	-DUSE_SYSTEM_LIBUSB=ON \
	-DUSE_SYSTEM_OPENAL=ON \
	-DUSE_SYSTEM_OPENSSL=ON \
	-DUSE_SYSTEM_SDL2=ON \
	-DUSE_SYSTEM_SOUNDTOUCH=ON \
	-DUSE_SYSTEM_VULKAN_HEADERS=ON \
	-DUSE_SYSTEM_ZSTD=ON \
	-DCITRA_USE_PRECOMPILED_HEADERS=OFF \
	-DCMAKE_INCLUDE_PATH="/usr/include/ffmpeg4.4" \
	-DSIRIT_USE_SYSTEM_SPIRV_HEADERS=ON \
	-DENABLE_QT_TRANSLATION=ON \
	-Wno-dev

	cmake --build build
}


package() {
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install build
	rm -rf "$pkgdir/usr/include"
	rm -rf "$pkgdir/usr/lib"
	install -Dm644 "$srcdir/$pkgname-unified-source-$pkgver/license.txt" "$pkgdir/usr/share/licenses/$pkgname/licenses.txt"
}
