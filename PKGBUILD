# PKGBUILD for android-ffmpeg
# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=aarch64
source android-env.sh ${_android_arch}

pkgname=android-${_android_arch}-libogg
pkgver=1.3.3
pkgrel=1
pkgdesc="Ogg bitstream and framing library (android)"
arch=(any)
url="http://xiph.org"
license=('BSD')
depends=('apache-ant'
         'android-ndk>=r18.b'
         "android-platform-$ANDROID_MINIMUM_PLATFORM"
         'android-sdk-25.2.5'
         'android-sdk-build-tools'
         'android-sdk-platform-tools')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-pkg-config')
source=(http://downloads.xiph.org/releases/ogg/libogg-${pkgver}.tar.gz)
sha256sums=('c2e8a485110b97550f453226ec644ebac6cb29d1caef2902c007edab4308d985')

build() {
    cd "${srcdir}"/libogg-${pkgver}

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
        --enable-static

    make $MAKEFLAGS
}

package() {
    cd "${srcdir}"/libogg-${pkgver}

    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}"/${ANDROID_LIBS}/share/doc
    ${ANDROID_STRIP} "${pkgdir}"/${ANDROID_LIBS}/lib/*.so
    ${ANDROID_STRIP} "$pkgdir"/${ANDROID_LIBS}/lib/*.a
}
