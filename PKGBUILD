# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

_android_arch=x86-64

pkgname=android-${_android_arch}-libdvdread
pkgver=6.1.3
pkgrel=1
pkgdesc="Library for reading DVD video disks (Android ${_android_arch})"
arch=('any')
url='https://www.videolan.org/developers/libdvdnav.html'
license=('GPL-2.0-or-later')
depends=('android-ndk')
makedepends=('android-configure')
optdepends=("android-${_android_arch}-libdvdcss: Decoding encrypted DVDs")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://download.videolan.org/pub/videolan/libdvdread/${pkgver}/libdvdread-${pkgver}.tar.bz2"{,.asc})
md5sums=('3c58d1624a71a16ff40f55dbaca82523'
         'SKIP')
validpgpkeys=('65F7C6B4206BD057A7EB73787180713BE58D1ADC') # VideoLAN Release Signing Key (2015)

build() {
    cd "${srcdir}/libdvdread-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --disable-apidoc
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libdvdread-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
