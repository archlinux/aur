# PKGBUILD for android-lame
# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=armv7a-eabi
source android-env.sh ${_android_arch}

pkgname=android-${_android_arch}-xz
pkgver=5.2.4
pkgrel=1
pkgdesc="Library and command line tools for XZ and LZMA compressed files (android)"
arch=('any')
url="https://tukaani.org/xz"
license=('custom' 'GPL' 'LGPL')
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-pkg-config')
source=("${url}/xz-${pkgver}.tar.gz")
sha256sums=('b512f3b726d3b37b6dc4c8570e137b9311e7552e8ccbab4d39d47ce5f4177145')

prepare() {
    check_ndk_version_ge_than 18.0
}

build() {
    cd "${srcdir}"/xz-${pkgver}

    export CC=${ANDROID_CC}
    export CXX=${ANDROID_CXX}
    target=${_android_arch/x86-/x86_}-linux-android

    ./configure \
        --host=${target} \
        --target=${target} \
        --build="$CHOST" \
        --prefix=${ANDROID_LIBS} \
        --libdir=${ANDROID_LIBS}/lib \
        --includedir=${ANDROID_LIBS}/include \
        --enable-shared \
        --enable-static \
        --disable-xz \
        --disable-xzdec \
        --disable-lzmadec \
        --disable-lzmainfo \
        --disable-lzma-links \
        --disable-scripts \
        --disable-doc


    make $MAKEFLAGS
}

package() {
    cd "${srcdir}"/xz-${pkgver}

    make DESTDIR="$pkgdir" install
#    rm -r "${pkgdir}"/${ANDROID_LIBS}/share
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_LIBS}/lib/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_LIBS}/lib/*.a
}
