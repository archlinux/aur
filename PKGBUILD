# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=armv7a-eabi
source android-env ${_android_arch}

pkgname=android-${_android_arch}-x265
pkgver=3.1.1
pkgrel=1
arch=('any')
pkgdesc='Open Source H265/HEVC video encoder (android)'
license=('GPL')
url='https://bitbucket.org/multicoreware/x265'
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-cmake' 'nasm')
source=("https://bitbucket.org/multicoreware/x265/downloads/x265_${pkgver}.tar.gz")
sha256sums=('827900c7cc0a0105b8a96460fab7cd22b97afa7b2835b5cb979c44bddaa3c8d0')

build() {
    cd "${srcdir}"/x265_${pkgver}
    unset LDFLAGS CPPFLAGS

    if [[ ${_android_arch} != x86 ]]; then
        mkdir build-12 && cd build-12

        android-${_android_arch}-cmake \
            -DLIB_INSTALL_DIR=lib \
            -DENABLE_SHARED=FALSE \
            -DENABLE_CLI=FALSE \
            -DHIGH_BIT_DEPTH=TRUE \
            -DMAIN12=TRUE \
            -DEXPORT_C_API=FALSE \
            ../source
        make $MAKEFLAGS

        cd .. && mkdir build-10 && cd build-10

        android-${_android_arch}-cmake \
            -DLIB_INSTALL_DIR=lib \
            -DENABLE_SHARED=FALSE \
            -DENABLE_CLI=FALSE \
            -DHIGH_BIT_DEPTH=TRUE \
            -DEXPORT_C_API=FALSE \
            ../source
        make $MAKEFLAGS

        cd .. && mkdir build-8 && cd build-8
        ln -s ../build-10/libx265.a libx265_main10.a
        ln -s ../build-12/libx265.a libx265_main12.a

        android-${_android_arch}-cmake \
            -DLIB_INSTALL_DIR=lib \
            -DENABLE_SHARED=FALSE \
            -DENABLE_CLI=FALSE \
            -DEXTRA_LIB='x265_main10.a;x265_main12.a' \
            -DEXTRA_LINK_FLAGS='-L .' \
            -DLINKED_10BIT=TRUE \
            -DLINKED_12BIT=TRUE \
            ../source
        make $MAKEFLAGS
    else
        mkdir build-8 && cd build-8

        android-${_android_arch}-cmake \
            -DLIB_INSTALL_DIR=lib \
            -DENABLE_SHARED=FALSE \
            -DENABLE_CLI=FALSE \
            ../source
        make $MAKEFLAGS
    fi
}

package() {
    cd "${srcdir}"/x265_${pkgver}/build-8

    make DESTDIR="$pkgdir" install
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
