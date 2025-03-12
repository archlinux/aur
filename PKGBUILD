# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>

_android_arch=riscv64

pkgname=android-${_android_arch}-fribidi
pkgver=1.0.16
pkgrel=1
arch=('any')
pkgdesc="A Free Implementation of the Unicode Bidirectional Algorithm (Android ${_android_arch})"
url="http://fribidi.org"
license=('LGPL')
groups=('android-fribidi')
depends=('android-ndk')
makedepends=('android-meson')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/fribidi/fribidi/archive/v${pkgver}.tar.gz")
md5sums=('d14d2f2ebf77d7dc7b090aa58cc9f32a')

build() {
    cd "${srcdir}/fribidi-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-meson build \
        -Ddocs=false
    ninja -C build
}

package() {
    cd "${srcdir}/fribidi-${pkgver}"
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" meson install -C build
    rm -r "${pkgdir}/${ANDROID_PREFIX_BIN}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true
}
