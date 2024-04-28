# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Jason Chu <jason@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Stephen Caraher <moskvax@gmail.com>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libiec61883
pkgver=1.2.0
pkgrel=2
arch=('any')
pkgdesc="A higher level API for streaming DV, MPEG-2 and audio over Linux IEEE 1394 (Android ${_android_arch})"
url='https://www.kernel.org/pub/linux/libs/ieee1394/'
license=('LGPL')
depends=("android-${_android_arch}-libraw1394")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://www.kernel.org/pub/linux/libs/ieee1394/libiec61883-${pkgver}.tar.xz"
        '0001-Unversioned-libs.patch')
md5sums=('ed91bc1727fac8e019402fc3724a283d'
         'db43c43533cf5efeb9b0289e438cb741')

prepare() {
    cd "${srcdir}/libiec61883-${pkgver}"

    patch -Np1 -i ../0001-Unversioned-libs.patch
}

build() {
    cd "${srcdir}/libiec61883-${pkgver}"
    source android-env ${_android_arch}

    # Platform specific patches
    case "$_android_arch" in
        aarch64)
             host=armv8-unknown-linux
            ;;
        armv7a-eabi)
             host=armv7-unknown-linux
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
        --host=${host}
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libiec61883-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "$pkgdir/${ANDROID_PREFIX_BIN}"
    rm -rf "$pkgdir/${ANDROID_PREFIX_SHARE}"
    rm -f "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so.*
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
