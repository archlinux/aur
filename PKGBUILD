# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

_android_arch=x86-64

pkgname=android-${_android_arch}-libdvdread
pkgver=7.0.1
pkgrel=1
pkgdesc="Library for reading DVD video disks (Android ${_android_arch})"
arch=('any')
url='https://www.videolan.org/developers/libdvdnav.html'
license=('GPL-2.0-or-later')
depends=('android-ndk')
makedepends=('android-meson'
             'ninja')
optdepends=("android-${_android_arch}-libdvdcss: Decoding encrypted DVDs")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://code.videolan.org/videolan/libdvdread/-/archive/${pkgver}/libdvdread-${pkgver}.tar.bz2")
md5sums=('120e9ead9f59e2031d05e6a61ffea8ec')

build() {
    cd "${srcdir}/libdvdread-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-meson build
    ninja -C build all
}

package() {
    cd "${srcdir}/libdvdread-${pkgver}"
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" ninja -C build install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true

    install -vDm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
