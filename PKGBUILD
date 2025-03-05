# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

_android_arch=aarch64

pkgname=android-${_android_arch}-dav1d
pkgver=1.5.1
pkgrel=1
arch=('any')
pkgdesc="AV1 cross-platform decoder focused on speed and correctness (Android ${_android_arch})"
url='https://code.videolan.org/videolan/dav1d/'
license=('BSD')
groups=('android-dav1d')
depends=('android-ndk')
makedepends=('android-meson'
             'ninja'
             'nasm'
             "android-${_android_arch}-xxhash")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://downloads.videolan.org/pub/videolan/dav1d/${pkgver}/dav1d-${pkgver}.tar.xz")
md5sums=('0ab0617fd17f0aa380a71bdc4a485315')

build() {
    cd "${srcdir}/dav1d-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-meson build \
        -Denable_tools=false \
        -Denable_tests=false
    ninja -C build all
}

package() {
    cd "${srcdir}/dav1d-${pkgver}"
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" ninja -C build install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true
}
