# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Filip Brcic <brcha@gna.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libxml2
pkgver=2.10.3
pkgrel=1
pkgdesc="XML parsing library, version 2 (android)"
arch=('any')
url="http://www.xmlsoft.org/"
license=('LGPL')
depends=('android-ndk'
         "android-${_android_arch}-libiconv"
         "android-${_android_arch}-zlib"
         "android-${_android_arch}-xz")
groups=(android-libxml2)
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-configure')
source=("https://gitlab.gnome.org/GNOME/libxml2/-/archive/v${pkgver}/libxml2-v${pkgver}.tar.gz")
md5sums=('4a8bc66943dd13f7ff2ee8816b808969')

prepare () {
    cd "${srcdir}"/libxml2-v${pkgver}
    source android-env ${_android_arch}

    # disable doc & examples
    sed -i "s| doc example | |g" Makefile.am
    autoreconf -vfi
}

build()
{
    cd "${srcdir}"/libxml2-v${pkgver}
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
    cd "${srcdir}"/libxml2-v${pkgver}
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}"/${ANDROID_PREFIX_BIN}
    rm -r "${pkgdir}"/${ANDROID_PREFIX_SHARE}
    rm -f "${pkgdir}"/${ANDROID_PREFIX_LIB}/xml2Conf.sh
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}

