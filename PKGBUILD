# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: sl1pkn07 <sl1pkn07@gmail.com>
# Contributor: jackoneill <cantabile.desu@gmail.com>

_android_arch=aarch64

pkgname=android-${_android_arch}-vapoursynth
pkgver=R69
pkgrel=1
arch=('any')
pkgdesc="A video processing framework with simplicity in mind (Android ${_android_arch})"
url='http://www.vapoursynth.com/'
license=('LGPL2.1'
         'custom:OFL')
depends=("android-${_android_arch}-zimg")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/vapoursynth/vapoursynth/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('87c61e60a1c3f23796121c635e472638')

prepare() {
    cd "${srcdir}/vapoursynth-${pkgver}"
    source android-env ${_android_arch}

    ./autogen.sh
}

build() {
    cd "${srcdir}/vapoursynth-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --enable-vsscript=no \
        --enable-python-module=no \
        --with-cython=no
    sed -i 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    sed -i 's|-Wl,--no-undefined||g' Makefile
    sed -i 's| -no-undefined | |g' Makefile
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/vapoursynth-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
