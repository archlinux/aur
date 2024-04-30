# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>

_android_arch=aarch64

pkgname=android-${_android_arch}-xvidcore
pkgver=1.3.7
pkgrel=1
arch=('any')
pkgdesc="XviD is an open source MPEG-4 video codec (Android ${_android_arch})"
url='https://www.xvid.com/'
license=('GPL')
depends=('android-ndk')
makedepends=('android-configure'
             'nasm')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://downloads.xvid.com/downloads/xvidcore-${pkgver}.tar.gz")
sha256sums=('abbdcbd39555691dd1c9b4d08f0a031376a3b211652c0d8b3b8aa9be1303ce2d')

build() {
    cd "${srcdir}/xvidcore/build/generic"
    source android-env ${_android_arch}

    android-${_android_arch}-configure
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/xvidcore/build/generic"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    mv -f "${pkgdir}/${ANDROID_PREFIX_LIB}/libxvidcore.so".*.* "${pkgdir}/${ANDROID_PREFIX_LIB}/libxvidcore.so"
    rm -f "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so.*
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
