# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Sven-Hendrik Haasr <svenstaro@gmail.com>
# Contributor: nl6720 <nl6720@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: d'Ronin <daronin@2600.com>

_android_arch=x86-64

pkgname=android-${_android_arch}-judy
pkgver=1.0.5
pkgrel=1
arch=('any')
pkgdesc='C library creating and accessing dynamic arrays (android)'
depends=('android-ndk')
makedepends=('android-configure')
license=('LGPL')
url='http://judy.sourceforge.net/'
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://downloads.sourceforge.net/judy/Judy-${pkgver}.tar.gz"
        '0001-Compile-JudyTablesGen-for-the-build-system.patch'
        '0002-Disable-lib-symlinks.patch')
sha256sums=('d2704089f85fdb6f2cd7e77be21170ced4b4375c03ef1ad4cf1075bd414a63eb'
            'acf8e44910c665fa818fa45e88b3b9f64f2ad987c8fc6798996a22eaf35d16a3'
            'b6eaf8ec489ffe0c71061084cfcb3d3640ad5bdae5e34c90de537459613484b3')

prepare() {
    cd "${srcdir}/judy-${pkgver}"

    patch -Np1 -i ../0001-Compile-JudyTablesGen-for-the-build-system.patch
    patch -Np1 -i ../0002-Disable-lib-symlinks.patch
}

build() {
    cd "${srcdir}/judy-${pkgver}"
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
    make -C "${PWD}/src" $MAKEFLAGS
}

package() {
    cd "${srcdir}/judy-${pkgver}"
    source android-env ${_android_arch}

    make -C "${PWD}/src" DESTDIR="$pkgdir" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
    rm -f "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so.*
}
