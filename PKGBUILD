# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=x86-64

pkgname=android-${_android_arch}-opus
pkgver=1.4
pkgrel=4
pkgdesc="Codec designed for interactive speech and audio transmission over the Internet (android)"
arch=('any')
url="http://www.opus-codec.org"
license=("BSD")
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-configure')
source=("http://downloads.us.xiph.org/releases/opus/opus-$pkgver.tar.gz")
sha256sums=('c9b32b4253be5ae63d1ff16eea06b94b5f0f2951b7a02aceef58e3a3ce49c51f')

prepare() {
    source android-env ${_android_arch}
    check_ndk_version_ge_than 18.0
}

build() {
    cd "${srcdir}"/opus-${pkgver}
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --enable-custom-modes \
        --disable-doc

    make $MAKEFLAGS
}

package() {
    cd "${srcdir}"/opus-${pkgver}
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}"/${ANDROID_PREFIX_SHARE}
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
