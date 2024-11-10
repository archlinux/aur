# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Martchus <martchus@gmx.net>

_android_arch=aarch64

pkgname=android-${_android_arch}-x265
pkgver=4.0
pkgrel=1
arch=('any')
pkgdesc="Open Source H265/HEVC video encoder (Android ${_android_arch})"
license=('GPL')
groups=('android-x265')
url='https://bitbucket.org/multicoreware/x265_git'
depends=('android-ndk')
makedepends=('android-cmake'
             'nasm')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://bitbucket.org/multicoreware/x265_git/downloads/x265_${pkgver}.tar.gz")
md5sums=('44e0082a7635eab2488bebd18875a09a')

build() {
    cd "${srcdir}/x265_${pkgver}"
    source android-env ${_android_arch}

    if [[ "${_android_arch}" = armv7a-eabi || "${_android_arch}" = x86 ]]; then
        ENABLE_PIC=TRUE
    else
        ENABLE_PIC=FALSE
    fi

    android-${_android_arch}-cmake \
        -S source \
        -B build-12 \
        -DCMAKE_CXX_STANDARD=11 \
        -DLIB_INSTALL_DIR=lib \
        -DENABLE_SHARED=FALSE \
        -DENABLE_PIC=${ENABLE_PIC} \
        -DENABLE_ASSEMBLY=FALSE \
        -DENABLE_CLI=FALSE \
        -DHIGH_BIT_DEPTH=TRUE \
        -DMAIN12=TRUE \
        -DEXPORT_C_API=FALSE \
        -Wno-dev
    make -C build-12 $MAKEFLAGS

    android-${_android_arch}-cmake \
        -S source \
        -B build-10 \
        -DCMAKE_CXX_STANDARD=11 \
        -DLIB_INSTALL_DIR=lib \
        -DENABLE_SHARED=FALSE \
        -DENABLE_PIC=${ENABLE_PIC} \
        -DENABLE_ASSEMBLY=FALSE \
        -DENABLE_CLI=FALSE \
        -DHIGH_BIT_DEPTH=TRUE \
        -DEXPORT_C_API=FALSE \
        -Wno-dev
    make -C build-10 $MAKEFLAGS

    mkdir -p build-8
    ln -s ../build-10/libx265.a build-8/libx265_main10.a
    ln -s ../build-12/libx265.a build-8/libx265_main12.a

    android-${_android_arch}-cmake \
        -S source \
        -B build-8 \
        -DCMAKE_CXX_STANDARD=11 \
        -DLIB_INSTALL_DIR=lib \
        -DENABLE_SHARED=TRUE \
        -DENABLE_HDR10_PLUS=TRUE \
        -DENABLE_PIC=${ENABLE_PIC} \
        -DENABLE_ASSEMBLY=FALSE \
        -DENABLE_CLI=FALSE \
        -DEXTRA_LIB='x265_main10.a;x265_main12.a' \
        -DEXTRA_LINK_FLAGS='-L.' \
        -DLINKED_10BIT=TRUE \
        -DLINKED_12BIT=TRUE \
        -Wno-dev
    sed -i 's|-lpthread||g' build-8/CMakeFiles/x265-shared.dir/link.txt
    sed -i 's|-Wl,--no-undefined-version||g' build-8/CMakeFiles/x265-shared.dir/link.txt
    sed -i 's|-Wl,--no-undefined||g' build-8/CMakeFiles/x265-shared.dir/link.txt
    make -C build-8 $MAKEFLAGS
}

package() {
    cd "${srcdir}/x265_${pkgver}"
    source android-env ${_android_arch}

    make -C build-8 DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
