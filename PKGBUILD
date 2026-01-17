# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: arjan <arjan@archlinux.org>
# Contributor Sarah Hay <sarahhay@mb.sympatico.ca>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libdvdcss
pkgver=1.5.0
pkgrel=1
pkgdesc="Portable abstraction library for DVD decryption (Android ${_android_arch})"
url="https://www.videolan.org/developers/libdvdcss.html"
arch=('any')
license=('GPL')
depends=('android-ndk')
makedepends=('android-meson'
             'ninja')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://code.videolan.org/videolan/libdvdcss/-/archive/${pkgver}/libdvdcss-${pkgver}.tar.bz2")
md5sums=('5ff8b0240506b96d04f1a0cf04ab77d1')

build() {
    cd "${srcdir}/libdvdcss-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-meson build
    ninja -C build all
}

package() {
    cd "${srcdir}/libdvdcss-${pkgver}"
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" ninja -C build install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true

    install -vDm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
