# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=aarch64

pkgname=android-${_android_arch}-lz4
pkgver=1.9.4
pkgrel=1
arch=('any')
pkgdesc='Very fast lossless compression algorithm (android)'
url='http://lz4.github.io/lz4/'
license=('GPL2')
depends=('android-ndk')
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/lz4/lz4/archive/v${pkgver}.tar.gz")
sha256sums=('0b0e3aa07c8c063ddf40b082bdf7e37a1562bda40a0ff5272957f3e987e0e54b')

build() {
    cd "${srcdir}/lz4-${pkgver}"
    source android-env ${_android_arch}

    mkdir -p build-static && pushd build-static
    android-${_android_arch}-cmake \
        -DLIB_INSTALL_DIR=lib \
        -DBUILD_SHARED_LIBS=OFF \
        -DLZ4_BUILD_CLI=OFF \
        -DLZ4_BUILD_LEGACY_LZ4C=OFF \
        ../build/cmake
    make $MAKEFLAGS
    popd

    mkdir -p build-shared && pushd build-shared
    android-${_android_arch}-cmake \
        -DLIB_INSTALL_DIR=lib \
        -DBUILD_SHARED_LIBS=ON \
        -DLZ4_BUILD_CLI=OFF \
        -DLZ4_BUILD_LEGACY_LZ4C=OFF \
        ../build/cmake
    make $MAKEFLAGS
    popd
}

package() {
    cd "${srcdir}/lz4-${pkgver}"
    source android-env ${_android_arch}

    for _type in static shared; do
        pushd build-${_type}
        make install DESTDIR="${pkgdir}"
        popd
    done

    #rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a || true
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
}
