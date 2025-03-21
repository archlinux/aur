# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

_android_arch=aarch64

pkgname=android-${_android_arch}-libdv
pkgver=1.0.0
pkgrel=2
pkgdesc="Decoder library for DV video (Android ${_android_arch})"
arch=('any')
url='https://libdv.sourceforge.net/'
license=('LGPL-2.1-or-later')
groups=('android-libdv')
depends=("android-${_android_arch}-popt")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://downloads.sourceforge.net/libdv/libdv-${pkgver}.tar.gz"
        '0001-Unversioned-libs.patch')
md5sums=('f895162161cfa4bb4a94c070a7caa6c7'
         'aebad644c1ec3cdfdf7db23ccef019f0')

prepare() {
    cd "${srcdir}/libdv-${pkgver}"

    patch -Np1 -i ../0001-Unversioned-libs.patch
}

build() {
    cd "${srcdir}/libdv-${pkgver}"
    source android-env ${_android_arch}

    extra_options=

    # Platform specific patches
    case "${_android_arch}" in
        aarch64)
             host=armv8-unknown-linux
            ;;
        armv7a-eabi)
             host=armv7-unknown-linux
            ;;
        riscv64)
             host=riscv64-unknown-linux
            ;;
        x86)
             host=x86-unknown-linux
            ;;
        x86-64)
             host=x86_64-unknown-linux
             extra_options="--disable-asm"
            ;;
        *)
            ;;
    esac

    ./configure \
        --host="${host}" \
        --prefix="${ANDROID_PREFIX}" \
        --libdir="${ANDROID_PREFIX_LIB}" \
        --includedir="${ANDROID_PREFIX_INCLUDE}" \
        --enable-shared \
        --enable-static \
        --disable-gtk \
        ${extra_options}
    make -C libdv $MAKEFLAGS
}

package() {
    cd "${srcdir}/libdv-${pkgver}"
    source android-env ${_android_arch}

    make -C libdv DESTDIR="${pkgdir}" install
    make DESTDIR="${pkgdir}" install-pkgconfigDATA
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so.*
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
