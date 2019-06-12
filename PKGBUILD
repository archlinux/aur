# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=x86-64
source android-env ${_android_arch}

pkgname=android-${_android_arch}-libogg
pkgver=1.3.3
pkgrel=4
pkgdesc="Ogg bitstream and framing library (android)"
arch=('any')
url="http://xiph.org"
license=('BSD')
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-configure')
source=("http://downloads.xiph.org/releases/ogg/libogg-${pkgver}.tar.gz")
sha256sums=('c2e8a485110b97550f453226ec644ebac6cb29d1caef2902c007edab4308d985')

prepare() {
    check_ndk_version_ge_than 18.0
}

build() {
    cd "${srcdir}"/libogg-${pkgver}

    android-${_android_arch}-configure
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}"/libogg-${pkgver}

    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}"/${ANDROID_PREFIX_SHARE}
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
