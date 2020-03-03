# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>

_android_arch=x86

pkgname=android-${_android_arch}-fribidi
pkgver=1.0.9
pkgrel=1
pkgdesc="A Free Implementation of the Unicode Bidirectional Algorithm (android)"
arch=('any')
url="http://fribidi.org"
license=('LGPL')
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-meson')
source=("https://github.com/fribidi/fribidi/archive/v${pkgver}.tar.gz")
sha256sums=('ef6f940d04213a0fb91a0177b2b57df2031bf3a7e2cd0ee2c6877a160fc206df')

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
