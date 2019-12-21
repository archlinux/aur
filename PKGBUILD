# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Filip Brcic <brcha@gna.org>

_android_arch=x86

pkgname=android-${_android_arch}-libxml2
pkgver=2.9.10
pkgrel=1
pkgdesc="XML parsing library, version 2 (android)"
arch=('any')
url="http://www.xmlsoft.org/"
license=('LGPL')
depends=('android-ndk'
         "android-${_android_arch}-libiconv"
         "android-${_android_arch}-zlib"
         "android-${_android_arch}-xz")
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-configure')
source=("http://xmlsoft.org/sources/libxml2-${pkgver}.tar.gz")
sha256sums=('aafee193ffb8fe0c82d4afef6ef91972cbaf5feea100edc2f262750611b4be1f')

prepare () {
    cd "${srcdir}"/libxml2-${pkgver}
    source android-env ${_android_arch}

    # disable doc & examples
    sed -i "s| doc example | |g" Makefile.am
    autoreconf -vfi
}

build()
{
    cd "${srcdir}"/libxml2-${pkgver}
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --without-python
    make $MAKEFLAGS

    # deps symbols are not included in static lib:
    ${ANDROID_AR} x ${ANDROID_PREFIX_LIB}/libiconv.a
    ${ANDROID_AR} x ${ANDROID_PREFIX_LIB}/liblzma.a
    ${ANDROID_AR} x ${ANDROID_PREFIX_LIB}/libz.a
    ${ANDROID_AR} cru .libs/libxml2.a *.o
    ${ANDROID_RANLIB} .libs/libxml2.a
}

package()
{
    cd "${srcdir}"/libxml2-${pkgver}
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}"/${ANDROID_PREFIX_BIN}
    rm -r "${pkgdir}"/${ANDROID_PREFIX_SHARE}
    rm -f "${pkgdir}"/${ANDROID_PREFIX_LIB}/xml2Conf.sh
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}

