# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-fribidi
pkgver=1.0.10
pkgrel=1
pkgdesc="A Free Implementation of the Unicode Bidirectional Algorithm (android)"
arch=('any')
url="http://fribidi.org"
license=('LGPL')
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-meson')
source=("https://github.com/fribidi/fribidi/archive/v${pkgver}.tar.gz")
sha256sums=('3ebb19c4184ed6dc324d2e291d7465bc6108a20be019f053f33228e07e879c4f')

build() {
    cd "${srcdir}"/fribidi-${pkgver}
    source android-env ${_android_arch}

    android-${_android_arch}-meson build \
         -D docs=false
    ninja -C build
}

package() {
    cd "${srcdir}"/fribidi-${pkgver}
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" meson install -C build
    rm -r "${pkgdir}"/${ANDROID_PREFIX_BIN}
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
}
