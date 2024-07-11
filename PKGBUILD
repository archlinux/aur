# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>

_android_arch=x86-64

pkgname=android-${_android_arch}-xvidcore
pkgver=1.3.7
pkgrel=2
arch=('any')
pkgdesc="XviD is an open source MPEG-4 video codec (Android ${_android_arch})"
url='https://www.xvid.com/'
license=('GPL')
depends=('android-ndk')
makedepends=('android-configure'
             'nasm')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://downloads.xvid.com/downloads/xvidcore-${pkgver}.tar.gz"
        "0001-Unversioned-libs.patch")
md5sums=('5c6c19324608ac491485dbb27d4da517'
         '9393a19ba305e6e45f27a1641fba9aed')

prepare() {
    cd "${srcdir}/xvidcore"

    patch -Np1 -i ../0001-Unversioned-libs.patch
}

build() {
    cd "${srcdir}/xvidcore/build/generic"
    source android-env ${_android_arch}

    case "${_android_arch}" in
        x86-64)
            extra_options="--disable-assembly"
            ;;
    esac

    android-${_android_arch}-configure \
        ${extra_options}
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/xvidcore/build/generic"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
