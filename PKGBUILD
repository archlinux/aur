# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: Eric Belanger <belanger@astro.umontreal.ca>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libasyncns
pkgver=0.8
pkgrel=2
arch=('any')
pkgdesc="A C library for executing name service queries asynchronously (Android ${_android_arch})"
url="https://0pointer.net/lennart/projects/libasyncns/"
license=('LGPL')
groups=('android-libasyncns')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("http://0pointer.de/lennart/projects/libasyncns/libasyncns-${pkgver}.tar.gz"
        '0001-Use-unversioned-libs.patch')
md5sums=('1f553d6ce1ad255bc83b3d8e9384f515'
         '4c5ee80adf19451f731c10af7da61617')

prepare() {
    cd "${srcdir}/libasyncns-${pkgver}"
    source android-env ${_android_arch}

    patch -Np1 -i ../0001-Use-unversioned-libs.patch

    NOCONFIGURE=1 ./bootstrap.sh
}

build() {
    cd "${srcdir}/libasyncns-${pkgver}"
    source android-env ${_android_arch}

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
            ;;
        *)
            ;;
    esac

    android-${_android_arch}-configure \
        --host=${host} \
        --sysconfdir="${ANDROID_PREFIX_ETC}" \
        --localstatedir="${ANDROID_PREFIX_VAR}"
    sed -i 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libasyncns-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
    rm -f "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so.*
}
