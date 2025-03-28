# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

_android_arch=x86

pkgname=android-${_android_arch}-faac
pkgver=1.31.1
pkgrel=1
arch=('any')
pkgdesc="Freeware Advanced Audio Coder (Android ${_android_arch})"
url="https://www.audiocoding.com/"
license=('GPL2'
         'custom')
groups=('android-faac')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/knik0/faac/archive/refs/tags/faac-${pkgver}.tar.gz")
md5sums=('a3f8194516769cfc3f8743364cc57824')

prepare() {
    cd "${srcdir}/faac-faac-${pkgver}"
    source android-env ${_android_arch}

    autoreconf -fiv
}

build() {
    cd "${srcdir}/faac-faac-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/faac-faac-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
