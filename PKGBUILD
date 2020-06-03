# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >

_android_arch=aarch64

pkgname=android-${_android_arch}-lcms2
pkgver=2.10
pkgrel=1
pkgdesc="Small-footprint color management engine, version 2 (android)"
arch=('any')
url="http://www.littlecms.com"
license=('MIT')
depends=('android-ndk'
         "android-${_android_arch}-libtiff")
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-configure')
source=("https://downloads.sourceforge.net/sourceforge/lcms/lcms2-${pkgver}.tar.gz")
sha256sums=('e11bc4e538587ec1530f9fef25f77261b94d5886c5ea81d8bb171a802df970ad')

prepare() {
    cd "${srcdir}"/lcms2-${pkgver}
    source android-env ${_android_arch}

    autoreconf -fi
}

build() {
    cd "${srcdir}"/lcms2-${pkgver}
    source android-env ${_android_arch}

    android-${_android_arch}-configure
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}"/lcms2-${pkgver}
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}"/${ANDROID_PREFIX_BIN}
    rm -r "${pkgdir}"/${ANDROID_PREFIX_SHARE}
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
