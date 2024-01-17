# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=aarch64

pkgname=android-${_android_arch}-lame
pkgver=3.100
pkgrel=7
pkgdesc="A high quality MPEG Audio Layer III (MP3) encoder (android)"
arch=('any')
url="http://lame.sourceforge.net/"
license=('LGPL')
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-configure' 'nasm')
source=("http://downloads.sourceforge.net/lame/lame-$pkgver.tar.gz")
md5sums=('83e260acbe4389b54fe08e0bdbf7cddb')

prepare() {
    source android-env ${_android_arch}
    check_ndk_version_ge_than 18.0

    sed -i "s/define DEPRECATED_OR_OBSOLETE_CODE_REMOVED 1/define DEPRECATED_OR_OBSOLETE_CODE_REMOVED 0/g" "${srcdir}"/lame-${pkgver}/include/lame.h
}

build() {
    cd "${srcdir}"/lame-${pkgver}
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --disable-frontend \
        --enable-nasm

    make $MAKEFLAGS
}

package() {
    cd "${srcdir}"/lame-${pkgver}
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}"/${ANDROID_PREFIX_SHARE}
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
