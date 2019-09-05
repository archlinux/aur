# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=x86-64

pkgname=android-${_android_arch}-libogg
pkgver=1.3.4
pkgrel=1
pkgdesc="Ogg bitstream and framing library (android)"
arch=('any')
url="http://xiph.org"
license=('BSD')
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-configure')
source=("http://downloads.xiph.org/releases/ogg/libogg-${pkgver}.tar.gz")
sha256sums=('fe5670640bd49e828d64d2879c31cb4dde9758681bb664f9bdbf159a01b0c76e')

prepare() {
    source android-env ${_android_arch}
    check_ndk_version_ge_than 18.0
}

build() {
    cd "${srcdir}"/libogg-${pkgver}
    source android-env ${_android_arch}

    android-${_android_arch}-configure
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}"/libogg-${pkgver}
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}"/${ANDROID_PREFIX_SHARE}
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
