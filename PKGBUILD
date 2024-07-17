# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

_android_arch=x86-64

pkgname=android-${_android_arch}-zimg
pkgver=3.0.5
pkgrel=2
arch=('any')
pkgdesc="Scaling, colorspace conversion, and dithering library (Android ${_android_arch})"
url='https://github.com/sekrit-twc/zimg'
license=('custom:WTFPL')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/sekrit-twc/zimg/archive/refs/tags/release-${pkgver}.tar.gz")
md5sums=('af2c08cc0e695f4c0c225feed14e9f20')

prepare() {
    cd "${srcdir}/zimg-release-${pkgver}"
    source android-env ${_android_arch}

    ./autogen.sh
}

build() {
    cd "${srcdir}/zimg-release-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure
    make $MAKEFLAGS
}

package(){
    cd "${srcdir}/zimg-release-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
