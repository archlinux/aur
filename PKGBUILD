# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=x86-64

pkgname=android-${_android_arch}-bzip2
pkgver=1.0.8
pkgrel=4
pkgdesc="A high-quality data compression program (Android ${_android_arch})"
arch=('any')
url="http://sources.redhat.com/bzip2"
license=("custom")
groups=(android-bzip2)
depends=('android-ndk')
makedepends=('android-environment'
             'android-pkg-config')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://fossies.org/linux/misc/bzip2-${pkgver}.tar.gz")
sha1sums=('bf7badf7e248e0ecf465d33c2f5aeec774209227')

build() {
    cd "$srcdir/bzip2-${pkgver}"
    source android-env ${_android_arch}

    export CFLAGS="${CFLAGS} -g -fPIC -Wall -Winline -D_FILE_OFFSET_BITS=64"

    make libbz2.a \
        CC="${ANDROID_CC}" \
        AR="${ANDROID_AR}" \
        RANLIB="${ANDROID_RANLIB}" \
        PREFIX="${ANDROID_PREFIX}" \
        CFLAGS="${CFLAGS}" \
        $MAKEFLAGS
    cmd="${CC} ${LDFLAGS} -shared -o libbz2.so *.o"
    echo "${cmd}"
    ${cmd}
}

package() {
    cd "$srcdir/bzip2-${pkgver}"
    source android-env ${_android_arch}

    install -m755 -d "${pkgdir}/${ANDROID_PREFIX_INCLUDE}"
    install -m644 bzlib.h "${pkgdir}/${ANDROID_PREFIX_INCLUDE}/"
    install -m755 -d "${pkgdir}/${ANDROID_PREFIX_LIB}"
    install -m644 libbz2.a "${pkgdir}/${ANDROID_PREFIX_LIB}/"
    install -m644 libbz2.so "${pkgdir}/${ANDROID_PREFIX_LIB}/"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
