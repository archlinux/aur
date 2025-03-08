# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-lzo
pkgver=2.10
pkgrel=2
arch=('any')
pkgdesc="Portable lossless data compression library (Android ${_android_arch})"
options=('android-lzo')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
license=("GPL")
url="http://www.oberhumer.com/opensource/lzo"
source=("http://www.oberhumer.com/opensource/lzo/download/lzo-${pkgver}.tar.gz")
md5sums=('39d3f3f9c55c87b1e5d6888e1420f4b5')

build() {
    cd "${srcdir}/lzo-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure
    make $MAKEFLAGS

    # build minilzo

    ${ANDROID_CC} $CFLAGS -fpic -Iinclude/lzo -o minilzo/minilzo.o -c minilzo/minilzo.c
    ${ANDROID_AR} rcs libminilzo.a minilzo/minilzo.o
    ${ANDROID_CC} $LDFLAGS -shared -o libminilzo.so -Wl,-soname,libminilzo.so minilzo/minilzo.o
}

package() {
    cd "${srcdir}/lzo-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    install -m644 libminilzo.so "${pkgdir}/${ANDROID_PREFIX_LIB}"
    install -m644 libminilzo.a "${pkgdir}/${ANDROID_PREFIX_LIB}"
    install -p -m644 minilzo/minilzo.h "${pkgdir}/${ANDROID_PREFIX_INCLUDE}/lzo"
    rm -r "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
