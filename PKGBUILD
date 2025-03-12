# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: drakkan <nicola.murino at gmail dot com>

_android_arch=aarch64

pkgname=android-${_android_arch}-libtasn1
pkgver=4.20.0
pkgrel=1
pkgdesc="The ASN.1 library used in GNUTLS (Android ${_android_arch})"
arch=('any')
url="http://www.gnu.org/software/libtasn1"
license=("GPL3, LGPL")
groups=('android-libtasn1')
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-configure')
source=("http://ftp.gnu.org/gnu/libtasn1/libtasn1-${pkgver}.tar.gz")
md5sums=('930f71d788cf37505a0327c1b84741be')

prepare() {
    source android-env ${_android_arch}
    check_ndk_version_ge_than 18.0
}

build() {
    cd "${srcdir}/libtasn1-${pkgver}"
    source android-env ${_android_arch}

    export CFLAGS="${CFLAGS} -D_FORTIFY_SOURCE=2 -D__USE_FORTIFY_LEVEL=2"
    export CPPFLAGS="${CPPFLAGS} -D_FORTIFY_SOURCE=2 -D__USE_FORTIFY_LEVEL=2"

    android-${_android_arch}-configure \
        --disable-doc
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libtasn1-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}/${ANDROID_PREFIX_BIN}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
