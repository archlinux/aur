# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libvorbis
pkgver=1.3.7
pkgrel=1
pkgdesc="Vorbis codec library (android)"
arch=('any')
url="http://xiph.org"
license=('custom')
depends=("android-${_android_arch}-libogg")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs)
source=("http://downloads.xiph.org/releases/vorbis/libvorbis-${pkgver}.tar.gz"
        'configure.patch')
sha256sums=('0e982409a9c3fc82ee06e08205b1355e5c6aa4c36bca58146ef399621b0ce5ab'
            '7d721302f969ef8477793e38f9ab7f1bd7b48da4f24864cc9e8c4873c3eb9a60')

prepare() {
    cd "${srcdir}"/libvorbis-${pkgver}
    source android-env ${_android_arch}

    patch -Np1 -i "../configure.patch"
}

build() {
    cd "${srcdir}"/libvorbis-${pkgver}
    source android-env ${_android_arch}

    android-${_android_arch}-configure
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}"/libvorbis-${pkgver}
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}"/${ANDROID_PREFIX_SHARE}
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
