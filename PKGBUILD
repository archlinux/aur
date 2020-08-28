# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=aarch64

pkgname=android-${_android_arch}-x265
pkgver=3.3
pkgrel=2
arch=('any')
pkgdesc='Open Source H265/HEVC video encoder (android)'
license=('GPL')
url='https://github.com/videolan/x265'
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-cmake' 'nasm')
source=("https://github.com/videolan/x265/archive/${pkgver}.tar.gz")
sha256sums=('ca25a38772fc6b49e5f1aa88733bc1dc92da7dc18f02a85cc3e99d76ba85b0a9')

build() {
    cd "${srcdir}"/x265-${pkgver}
    source android-env ${_android_arch}
    unset LDFLAGS CPPFLAGS

    if [[ ${_android_arch} != x86 ]]; then
        mkdir build-12 && cd build-12

        android-${_android_arch}-cmake \
            -DCMAKE_CXX_STANDARD=11 \
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
            -DCMAKE_CXX_STANDARD=11 \
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
            -DCMAKE_CXX_STANDARD=11 \
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
            -DCMAKE_CXX_STANDARD=11 \
            -DLIB_INSTALL_DIR=lib \
            -DENABLE_SHARED=FALSE \
            -DENABLE_CLI=FALSE \
            ../source
        make $MAKEFLAGS
    fi
}

package() {
    cd "${srcdir}"/x265-${pkgver}/build-8
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
