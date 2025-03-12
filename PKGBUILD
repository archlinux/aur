# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Eric Bélanger <eric@archlinux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-flac
pkgver=1.5.0
pkgrel=1
arch=('any')
pkgdesc="Free Lossless Audio Codec (Android ${_android_arch})"
url='https://xiph.org/flac/'
license=('BSD'
         'GPL')
groups=('android-flac')
depends=("android-${_android_arch}-libogg")
makedepends=('android-cmake'
             'nasm')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/xiph/flac/releases/download/${pkgver}/flac-${pkgver}.tar.xz")
md5sums=('0bb45bcf74338b00efeec121fff27367')

prepare() {
    cd "${srcdir}/flac-${pkgver}"
    source android-env ${_android_arch}

    # Shorten tests
    sed -i 's/FLAC__TEST_LEVEL=1/FLAC__TEST_LEVEL=0/' test/CMakeLists.txt

    if [ "${ANDROID_MINIMUM_PLATFORM}" -lt 24 ]; then
        files=(include/FLAC/callback.h
               include/FLAC/stream_decoder.h
               include/FLAC/stream_encoder.h
               include/share/compat.h
               src/flac/decode.c
               src/flac/encode.c
               src/flac/foreign_metadata.c
               src/flac/iffscan.c
               src/libFLAC/metadata_iterators.c
               src/libFLAC/stream_decoder.c
               src/libFLAC/stream_encoder.c
               src/test_libFLAC++/decoders.cpp
               src/test_libFLAC++/encoders.cpp
               src/test_libFLAC++/metadata_manip.cpp
               src/test_libFLAC/decoders.c
               src/test_libFLAC/encoders.c
               src/test_libFLAC/metadata_manip.c
               src/utils/flacdiff/main.cpp)

        for f in "${files[@]}"; do
            sed -i 's|fseeko|fseek|g' $f
            sed -i 's|ftello|ftell|g' $f
        done
    fi
}

build() {
    cd "${srcdir}/flac-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build-shared \
        -DBUILD_SHARED_LIBS=ON \
        -DBUILD_DOCS=OFF \
        -DBUILD_EXAMPLES=OFF \
        -DBUILD_PROGRAMS=OFF \
        -DINSTALL_MANPAGES=OFF \
        -DBUILD_TESTING=OFF \
        -DWITH_STACK_PROTECTOR=OFF \
        -DOGG_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DOGG_LIBRARY="${ANDROID_PREFIX_LIB}/libogg.so"
    make -C build-shared $MAKEFLAGS

    android-${_android_arch}-cmake \
        -S . \
        -B build-static \
        -DBUILD_SHARED_LIBS=OFF \
        -DBUILD_DOCS=OFF \
        -DBUILD_EXAMPLES=OFF \
        -DBUILD_PROGRAMS=OFF \
        -DINSTALL_MANPAGES=OFF \
        -DBUILD_TESTING=OFF \
        -DWITH_STACK_PROTECTOR=OFF \
        -DOGG_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DOGG_LIBRARY="${ANDROID_PREFIX_LIB}/libogg.a"
    make -C build-static $MAKEFLAGS
}

package() {
    cd "${srcdir}/flac-${pkgver}"
    source android-env ${_android_arch}

    make -C build-shared DESTDIR="${pkgdir}" install
    make -C build-static DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
