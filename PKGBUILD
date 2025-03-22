# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Andrew Cook <ariscop@gmail.com>

_android_arch=x86

pkgname=android-${_android_arch}-libbluray
pkgver=1.3.4
pkgrel=2
arch=('any')
pkgdesc="Library to access Blu-Ray disks for video playback (Android ${_android_arch})"
url='https://www.videolan.org/developers/libbluray.html'
license=('LGPL2.1')
groups=('android-libbluray')
depends=("android-${_android_arch}-fontconfig"
         "android-${_android_arch}-freetype2"
         "android-${_android_arch}-libxml2")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://code.videolan.org/videolan/libbluray/-/archive/${pkgver}/libbluray-${pkgver}.tar.bz2"
        'https://code.videolan.org/videolan/libudfread/-/archive/master/libudfread-master.tar.bz2')
md5sums=('8fa45abe567c1da2a6a936fcb584c51d'
         'SKIP')

prepare() {
    cd "${srcdir}/libbluray-${pkgver}"

    autoreconf -fiv

    rm -rvf contrib/libudfread
    ln -s ../../libudfread-master contrib/libudfread
}

build() {
    cd "${srcdir}/libbluray-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --enable-examples=no \
        --disable-bdjava-jar \
        --disable-doxygen-doc \
        --disable-doxygen-dot \
        --disable-doxygen-html \
        --disable-doxygen-ps \
        --disable-doxygen-pdf
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libbluray-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
