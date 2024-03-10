# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Filip Brcic <brcha@gna.org>
# Contributor: ant32 <antreimer@gmail.com>

_android_arch=x86-64

pkgname=android-${_android_arch}-termcap
pkgver=1.3.1
pkgrel=3
arch=('any')
pkgdesc="Terminal feature database (Android, ${_android_arch})"
url="ftp://ftp.gnu.org/gnu/termcap/"
license=('GPL' 'LGPL')
depends=('android-ndk')
makedepends=('android-environment')
options=(!strip !buildflags staticlibs !emptydirs)
source=("http://ftp.gnu.org/gnu/termcap/termcap-${pkgver}.tar.gz"
        "0001-Fix-missing-headers.patch")
md5sums=('ffe6f86e63a3a29fa53ac645faaabdfa'
         'fca1d4ab693214f13651bc529e6d640c')

prepare() {
    cd "${srcdir}"/termcap-${pkgver}

    patch -Np1 -i ../0001-Fix-missing-headers.patch
}

build() {
    cd "${srcdir}"/termcap-${pkgver}
    source android-env ${_android_arch}

    ${ANDROID_CC} -fPIC -c termcap.c -DHAVE_STRING_H=1 -DHAVE_UNISTD_H=1 -DSTDC_HEADERS=1
    ${ANDROID_CC} -fPIC -c tparam.c -DHAVE_STRING_H=1 -DHAVE_UNISTD_H=1 -DSTDC_HEADERS=1
    ${ANDROID_CC} -fPIC -c version.c -DHAVE_STRING_H=1 -DHAVE_UNISTD_H=1 -DSTDC_HEADERS=1

    # Build a shared library.
    ${ANDROID_CC} -shared -Wl,-soname,libtermcap.so \
        -o libtermcap.so termcap.o tparam.o version.o

    # Build a static library.
    ${ANDROID_AR} rc libtermcap.a termcap.o tparam.o version.o
    ${ANDROID_RANLIB} libtermcap.a
}

package() {
    cd "${srcdir}"/termcap-${pkgver}
    source android-env ${_android_arch}

    mkdir -p "${pkgdir}"/${ANDROID_PREFIX_INCLUDE}
    mkdir -p "${pkgdir}"/${ANDROID_PREFIX_LIB}
    install -D -m755 termcap.h "${pkgdir}"/${ANDROID_PREFIX_INCLUDE}/termcap.h
    install -D -m755 libtermcap.so "${pkgdir}"/${ANDROID_PREFIX_LIB}/libtermcap.so
    install -D -m755 libtermcap.a "${pkgdir}"/${ANDROID_PREFIX_LIB}/libtermcap.a
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
