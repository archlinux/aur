# PKGBUILD for android-speex
# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=aarch64
source android-env.sh ${_android_arch}

pkgname=android-${_android_arch}-speex
pkgver=1.2.0
pkgrel=1
pkgdesc="A free codec for free speech (android)"
arch=(any)
url="http://www.speex.org"
license=("BSD")
depends=("android-${_android_arch}-speexdsp"
         "android-${_android_arch}-libogg")
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-pkg-config')
source=("http://downloads.xiph.org/releases/speex/speex-$pkgver.tar.gz")
md5sums=('8ab7bb2589110dfaf0ed7fa7757dc49c')

build() {
    cd "${srcdir}"/speex-${pkgver}

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
        --disable-binaries

    make $MAKEFLAGS
}

package() {
    cd "${srcdir}"/speex-${pkgver}

    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}"/${ANDROID_LIBS}/share
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_LIBS}/lib/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_LIBS}/lib/*.a
}
