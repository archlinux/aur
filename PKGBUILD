# PKGBUILD for android-libogg
# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=x86
source android-env.sh ${_android_arch}

pkgname=android-${_android_arch}-libogg
pkgver=1.3.3
pkgrel=2
pkgdesc="Ogg bitstream and framing library (android)"
arch=('any')
url="http://xiph.org"
license=('BSD')

if [ -z "${ANDROID_NO_DEPS}" ]; then
    depends=('android-ndk')
fi

options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-pkg-config')
source=(http://downloads.xiph.org/releases/ogg/libogg-${pkgver}.tar.gz)
sha256sums=('c2e8a485110b97550f453226ec644ebac6cb29d1caef2902c007edab4308d985')

prepare() {
    check_ndk_version_ge_than 18.0
}

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
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_LIBS}/lib/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_LIBS}/lib/*.a
}
