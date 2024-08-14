# Maintainer: username227 <gfrank227 at gmail dot com>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>

_pkgver=518f723
_date=20240717
_pkgname=unified-source-$_date-$_pkgver
pkgname=citra
pkgver=r10091.518f723
pkgrel=2
epoch=1
arch=('x86_64')
pkgdesc='An experimental open-source Nintendo 3DS emulator/debugger'
url='https://github.com/PabloMK7/citra'
license=('GPL-2.0-or-later')
depends=('sdl2' 'mbedtls' 'speexdsp' 'qt6-multimedia' 'ffmpeg' 'libfdk-aac' 'libusb' 'openssl' 'glibc' 'gcc-libs' 'sndio' 'zstd' 'soundtouch' 'fmt' 'libinih' 'openal' 'enet' 'boost-libs' 'zydis')
makedepends=('git' 'cmake' 'python' 'doxygen' 'rapidjson' 'llvm' 'qt6-tools' 'gcc' 'glslang' 'vulkan-headers' 'nlohmann-json' 'catch2' 'clang' 'ninja' 'boost')
conflicts=('citra-appimage')
options=('!lto')
source=("https://github.com/PabloMK7/citra/releases/download/r$_pkgver/citra-unified-source-$_date-$_pkgver.tar.xz")
sha256sums=('3cb51ca2666d7ce44066966ab5b986c3d7e3e4ab9b12c67d5cd97d6a676c40ec')

build() {
    # Fix to help cmake find libusb
    export CFLAGS=$(echo $CFLAGS | sed 's/-Wp,-D_FORTIFY_SOURCE=3//g')
    export CXXFLAGS=$(echo $CXXFLAGS | sed 's/-Wp,-D_FORTIFY_SOURCE=3//g')
    CXXFLAGS+=" -I/usr/lib/libusb-1.0 -flto=thin"
    CFLAGS+=" -flto=thin"
    
    cmake -B build -S "$pkgname-$_pkgname" -G Ninja \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=None \
	-DCMAKE_CXX_COMPILER=clang++ \
	-DCMAKE_C_COMPILER=clang \
	-DENABLE_QT_TRANSLATION=ON \
	-DUSE_DISCORD_PRESENCE=ON \
	-DCMAKE_CXX_FLAGS="$CFLAGS" \
	-DCMAKE_C_FLAGS="$CXXFLAGS" \
	-DUSE_SYSTEM_BOOST=ON \
	-DUSE_SYSTEM_CATCH2=ON \
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
	-DUSE_SYSTEM_ZSTD=ON
	cmake --build build
}

package() {
    DESTDIR="$pkgdir/" cmake --install build
}
