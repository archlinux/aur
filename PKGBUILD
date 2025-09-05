# Maintainer: username227 <gfrank227 at gmail dot com>
# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname='mandarine'
_date=20250128
_hash=418c25c
_tag=r1.2.1
pkgver=1.2.1
pkgrel=3
arch=('x86_64')
pkgdesc='3ds emulator - citra fork with tweaks/enhancements'
url='https://github.com/mandarine3ds/mandarine'
license=("GPL-2.0-or-later")
depends=('sdl2-compat' 'mbedtls' 'speexdsp' 'qt6-multimedia' 'ffmpeg' 'libfdk-aac' 'libusb' 'openssl' 'glibc' 'gcc-libs' 'sndio' 'zstd' 'soundtouch' 'fmt' 'libinih' 'openal' 'enet' 'boost-libs')
makedepends=('cmake' 'python' 'doxygen' 'rapidjson' 'llvm' 'qt6-tools' 'gcc' 'glslang' 'vulkan-headers' 'nlohmann-json' 'catch2' 'clang' 'ninja' 'boost')
source=("https://github.com/mandarine3ds/mandarine/releases/download/${_tag}/${pkgname}-unified-source-${_date}-${_hash}.tar.xz"
		"https://github.com/username227/mcl/archive/refs/tags/mcl.tar.gz")
sha256sums=('4efb1dae1b6711beb0751a355eb3e81aa18d8c5ba000bc8dfc6a78ec6d21b599'
            'e1276b22b7be39871f5c1eee1e63365e77f818539113e9a9cb0b30c7165abc6c')
prepare() {
	rm -r $srcdir/$pkgname-unified-source-$_date-$_hash/externals/dynarmic/externals/mcl
	mv $srcdir/mcl-mcl $srcdir/$pkgname-unified-source-$_date-$_hash/externals/dynarmic/externals/mcl
}
build() {
    export CFLAGS=$(echo $CFLAGS | sed 's/-Wp,-D_FORTIFY_SOURCE=3//g')
    export CXXFLAGS=$(echo $CXXFLAGS | sed 's/-Wp,-D_FORTIFY_SOURCE=3//g')
    CXXFLAGS+=" -I/usr/lib/libusb-1.0 -flto=thin"
    CFLAGS+=" -flto=thin"

    cmake -B build -S "$pkgname-unified-source-${_date}-${_hash}" -G Ninja \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=None \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DCMAKE_C_COMPILER=clang \
    -DENABLE_QT_TRANSLATION=ON \
    -DUSE_DISCORD_PRESENCE=ON \
	-DCMAKE_CXX_FLAGS="$CXXFLAGS" \
	-DCMAKE_C_FLAGS="$CFLAGS" \
	-DUSE_SYSTEM_CATCH2=ON \
	-DUSE_SYSTEM_FMT=ON \
	-DUSE_SYSTEM_GLSLANG=OFF \
	-DUSE_SYSTEM_INIH=ON \
	-DUSE_SYSTEM_JSON=ON \
	-DUSE_SYSTEM_LIBUSB=ON \
	-DUSE_SYSTEM_OPENAL=ON \
	-DUSE_SYSTEM_BOOST=OFF \
	-DUSE_SYSTEM_OPENSSL=ON \
	-DUSE_SYSTEM_SDL2=ON \
	-DUSE_SYSTEM_SOUNDTOUCH=ON \
	-DUSE_SYSTEM_VULKAN_HEADERS=OFF \
	-DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
	-DMANDARINE_WARNINGS_AS_ERRORS=OFF \
	-Wno-dev
    cmake --build build
}
package() {
    DESTDIR="$pkgdir/" cmake --install build
    rm -rf "$pkgdir/usr/include" "$pkgdir/usr/lib"
}
