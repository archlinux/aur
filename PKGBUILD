# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >

_android_arch=x86

pkgname=android-${_android_arch}-lcms2
pkgver=2.17
pkgrel=1
pkgdesc="Small-footprint color management engine, version 2 (Android ${_android_arch})"
arch=('any')
url="http://www.littlecms.com"
license=('MIT')
groups=('android-lcms2')
depends=('android-ndk'
         "android-${_android_arch}-libtiff")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://downloads.sourceforge.net/sourceforge/lcms/lcms2-${pkgver}.tar.gz")
md5sums=('9f44275ee8ac122817e94fdc50ecce13')

prepare() {
    cd "${srcdir}/lcms2-${pkgver}"
    source android-env ${_android_arch}

    autoreconf -fi
}

build() {
    cd "${srcdir}/lcms2-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/lcms2-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}/${ANDROID_PREFIX_BIN}"
    rm -r "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
