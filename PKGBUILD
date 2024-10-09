# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-faac
pkgver=1.30
pkgrel=1
arch=('any')
pkgdesc="Freeware Advanced Audio Coder (Android ${_android_arch})"
url="https://www.audiocoding.com/"
license=('GPL2'
         'custom')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/knik0/faac/archive/${pkgver/./_}/faac-${pkgver/./_}.tar.gz"
        "faac-1.30-pkgconfig.patch::https://github.com/knik0/faac/commit/11215a2dc792d28a8fa7bbef059c6798d248a0ea.patch")
md5sums=('8d61e6d55088e599aa91532d5e6995b0'
         '8142b5e0c0b169ffd61c8dfdf336fbaa')

prepare() {
    cd "${srcdir}/faac-${pkgver/./_}"
    source android-env ${_android_arch}

    # add pkg-config file
    patch -Np1 -i ../faac-1.30-pkgconfig.patch
    autoreconf -fiv
}

build() {
    cd "${srcdir}/faac-${pkgver/./_}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/faac-${pkgver/./_}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
