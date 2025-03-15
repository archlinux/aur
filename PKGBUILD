# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=x86-64

pkgname=android-${_android_arch}-libvorbis
pkgver=1.3.7
pkgrel=2
pkgdesc="Vorbis codec library (Android ${_android_arch})"
arch=('any')
url="http://xiph.org"
license=('custom')
groups=("android-libvorbis")
depends=("android-${_android_arch}-libogg")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs)
source=("http://downloads.xiph.org/releases/vorbis/libvorbis-${pkgver}.tar.gz"
        'configure.patch')
md5sums=('9b8034da6edc1a17d18b9bc4542015c7'
         '38673aee77c0972a8aed63a57392e056')

prepare() {
    cd "${srcdir}/libvorbis-${pkgver}"
    source android-env ${_android_arch}

    patch -Np1 -i ../configure.patch
}

build() {
    cd "${srcdir}/libvorbis-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libvorbis-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
