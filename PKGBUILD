# Maintainer: username227 <gfrank227 at gmail dot com>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>

_pkgver=608383e
_date=20240927
_pkgname=unified-source-$_date-$_pkgver
pkgname=citra
pkgver=r10112.608383e
pkgrel=1
epoch=2
arch=('x86_64')
pkgdesc='An experimental open-source Nintendo 3DS emulator/debugger'
url='https://github.com/username227/citra'
license=('GPL-2.0-or-later')
depends=('sdl2' 'mbedtls' 'speexdsp' 'qt6-multimedia' 'ffmpeg' 'libfdk-aac' 'libusb' 'openssl' 'glibc' 'gcc-libs' 'sndio' 'zstd' 'soundtouch' 'fmt' 'libinih' 'openal' 'enet' 'boost-libs' 'zydis')
makedepends=('git' 'cmake' 'python' 'doxygen' 'rapidjson' 'llvm' 'qt6-tools' 'gcc13' 'glslang' 'vulkan-headers' 'nlohmann-json' 'catch2' 'clang' 'ninja' 'boost')
conflicts=('citra-appimage')
options=('!lto')
source=("https://github.com/username227/citra/releases/download/r608383e/citra-unified-source-${_date}-${_pkgver}.tar.xz"
		"https://github.com/username227/mcl/archive/refs/tags/mcl.tar.gz")
sha256sums=('ef7e726ba77535ebe7ea2b9bb75b16fed9148b70c5b94fb0a7939f6802c1d076'
            'e1276b22b7be39871f5c1eee1e63365e77f818539113e9a9cb0b30c7165abc6c')

prepare() {
	rm -r $srcdir/citra-unified-source-$_date-$_pkgver/externals/dynarmic/externals/mcl
	mv $srcdir/mcl-mcl $srcdir/citra-unified-source-$_date-$_pkgver/externals/dynarmic/externals/mcl
}
build() {
    # Fix to help cmake find libusb
    export CFLAGS=$(echo $CFLAGS | sed 's/-Wp,-D_FORTIFY_SOURCE=3//g')
    export CXXFLAGS=$(echo $CXXFLAGS | sed 's/-Wp,-D_FORTIFY_SOURCE=3//g')
    CXXFLAGS+=" -I/usr/lib/libusb-1.0 -flto=thin"
    CFLAGS+=" -flto=thin"
    
    cmake -B build -S "$pkgname-$_pkgname" \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=None \
	-DCMAKE_CXX_COMPILER=clang++ \
	-DCMAKE_C_COMPILER=clang \
	-DENABLE_QT_TRANSLATION=ON \
	-DUSE_DISCORD_PRESENCE=ON \
	-DCMAKE_CXX_FLAGS="$CFLAGS" \
	-DCMAKE_C_FLAGS="$CXXFLAGS" \
	-DCITRA_WARNINGS_AS_ERRORS=OFF \
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
	-DUSE_SYSTEM_ZSTD=ON \
	-DCMAKE_POLICY_VERSION_MINIMUM=3.5
	cmake --build build
}

package() {
    DESTDIR="$pkgdir/" cmake --install build
}
