# Maintainer: username227 <gfrank227 at gmail dot com>
# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# The pkgbuild is based on the original pkgbuild for citra.

pkgname=lime3ds
pkgver=2119.1
pkgrel=7
arch=('x86_64')
pkgdesc='An experimental open-source Nintendo 3DS emulator/debugger'
url='https://github.com/Lime3DS/lime3DS-archive'
license=('GPL-2.0-or-later')
depends=('sdl2' 'mbedtls' 'speexdsp' 'qt6-base' 'qt6-multimedia' 'ffmpeg' 'libfdk-aac' 'libusb' 'openssl' 'glibc' 'gcc-libs' 'sndio' 'zstd' 'soundtouch' 'fmt' 'libinih' 'openal' 'enet' 'zydis' 'boost-libs'
	 'glslang' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'python' 'doxygen' 'rapidjson' 'llvm' 'qt6-tools' 'gcc' 'vulkan-headers' 'nlohmann-json' 'catch2' 'clang' 'ninja' 'boost')
conflicts=('lime3ds-appimage' 'lime3ds-git')
options=('!lto')
source=("https://github.com/username227/lime3ds/releases/download/1/lime3ds-unified-source-2119.1.tar.xz"
		"https://github.com/username227/mcl/archive/refs/tags/mcl.tar.gz"
		"robin-map_fix.patch")
md5sums=('60aeb81bb0825594cfed33dbc29dd4a8'
         '1a982655170c2235680d1a670a407586'
         '6e30462371800f21c53904f101f5d46d')


prepare() {
	patch $srcdir/$pkgname-unified-source-$pkgver/CMakeLists.txt robin-map_fix.patch
	rm -r $srcdir/lime3ds-unified-source-2119.1/externals/dynarmic/externals/mcl
	mv $srcdir/mcl-mcl $srcdir/lime3ds-unified-source-2119.1/externals/dynarmic/externals/mcl
}

build() {
    # Fix to help cmake find libusb
    export CFLAGS=$(echo $CFLAGS | sed 's/-Wp,-D_FORTIFY_SOURCE=3//g')
    export CXXFLAGS=$(echo $CXXFLAGS | sed 's/-Wp,-D_FORTIFY_SOURCE=3//g')
    CXXFLAGS+=" -I/usr/lib/libusb-1.0 -flto=thin"
    CFLAGS+=" -flto=thin"
    
    cmake -B build -S "$pkgname-unified-source-$pkgver" -G Ninja \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=None \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DCMAKE_C_COMPILER=clang \
    -DENABLE_QT_TRANSLATION=ON \
    -DUSE_DISCORD_PRESENCE=ON \
	-DCMAKE_C_FLAGS="$CFLAGS" \
	-DCMAKE_CXX_FLAGS="$CXXFLAGS" \
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
	-DUSE_SYSTEM_VULKAN_HEADERS=OFF \
	-DLIME3DS_WARNINGS_AS_ERRORS=OFF \
	-DUSE_SYSTEM_ZSTD=ON \
	-DDYNARMIC_USE_BUNDLED_EXTERNALS=ON \
	-DCMAKE_POLICY_VERSION_MINIMUM=3.5
    cmake --build build
}

package() {   
    DESTDIR="$pkgdir/" cmake --install build
    rm -rf $pkgdir/usr/include/
}
