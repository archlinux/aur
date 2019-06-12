# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=x86-64
source android-env ${_android_arch}

pkgname=android-${_android_arch}-libvorbis
pkgver=1.3.6
pkgrel=3
pkgdesc="Vorbis codec library (android)"
arch=('any')
url="http://xiph.org"
license=('custom')
depends=("android-${_android_arch}-libogg")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs)
source=("http://downloads.xiph.org/releases/vorbis/libvorbis-${pkgver}.tar.gz"
        'configure.patch')
sha256sums=('6ed40e0241089a42c48604dc00e362beee00036af2d8b3f46338031c9e0351cb'
            '7d721302f969ef8477793e38f9ab7f1bd7b48da4f24864cc9e8c4873c3eb9a60')

prepare() {
    cd "${srcdir}"/libvorbis-${pkgver}

    patch -Np1 -i "../configure.patch"
}

build() {
    cd "${srcdir}"/libvorbis-${pkgver}

    android-${_android_arch}-configure
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}"/libvorbis-${pkgver}

    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}"/${ANDROID_PREFIX_SHARE}
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
