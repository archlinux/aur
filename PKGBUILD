# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=x86

pkgname=android-${_android_arch}-lame
pkgver=3.100
pkgrel=9
pkgdesc="A high quality MPEG Audio Layer III (MP3) encoder (Android ${_android_arch})"
arch=('any')
url="http://lame.sourceforge.net/"
license=('LGPL')
groups=('android-lame')
depends=('android-ndk')
makedepends=('android-configure' 'nasm')
options=(!strip !buildflags staticlibs !emptydirs)
source=("http://downloads.sourceforge.net/lame/lame-${pkgver}.tar.gz"
        'lame.pc.in')
md5sums=('83e260acbe4389b54fe08e0bdbf7cddb'
         '23be318682f69026533062f470def74c')

prepare() {
    cd "${srcdir}/lame-${pkgver}"
    source android-env ${_android_arch}
    check_ndk_version_ge_than 18.0

    sed -i "s/define DEPRECATED_OR_OBSOLETE_CODE_REMOVED 1/define DEPRECATED_OR_OBSOLETE_CODE_REMOVED 0/g" include/lame.h
    sed "s/@VERSION@/${pkgver}/g" ../lame.pc.in > lame.pc
    sed -i "s|@ANDROID_PREFIX@|${ANDROID_PREFIX}|g" lame.pc
}

build() {
    cd "${srcdir}/lame-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --disable-frontend \
        --enable-nasm
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/lame-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a

    install -vDm 644 lame.pc -t "${pkgdir}/${ANDROID_PREFIX_LIB}/pkgconfig/"
}
