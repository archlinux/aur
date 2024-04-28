# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: damir <damir@archlinux.org>
# Contributor: Robert Emil Berge <robert@rebi.no>

_android_arch=aarch64

pkgname=android-${_android_arch}-libavc1394
pkgver=0.5.4
pkgrel=1
arch=('any')
pkgdesc="Library to control A/V devices using the 1394 TA AV/C commands (Android ${_android_arch})"
url='https://sourceforge.net/projects/libavc1394/'
license=('GPL-2.0-or-later AND LGPL-2.1-or-later')
depends=("android-${_android_arch}-libraw1394")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://downloads.sourceforge.net/libavc1394/libavc1394-$pkgver.tar.gz"
        '0001-Unversioned-libs.patch')
md5sums=('caf0db059d8b8d35d6f08e6c0e1c7dfe'
         'a58b96562f366a9614de69403decfc65')

prepare() {
    cd "${srcdir}/libavc1394-$pkgver"

    patch -Np1 -i ../0001-Unversioned-libs.patch

    # Disable test build

    sed -i 's|common libavc1394 librom1394 test|common libavc1394 librom1394|g' Makefile.am
    sed -i 's|common libavc1394 librom1394 test|common libavc1394 librom1394|g' Makefile.in
    sed -i '/CONFIG_FILES test\/Makefile/d' configure
    sed -i 's| test/Makefile | |g' configure
}

build() {
    cd "${srcdir}/libavc1394-$pkgver"
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
    cd "${srcdir}/libavc1394-$pkgver"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -f "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so.*
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
