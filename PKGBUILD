# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: G_Syme <demichan@mail.upb.de>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libass
pkgver=0.17.3
pkgrel=1
arch=('any')
pkgdesc="A portable library for SSA/ASS subtitles rendering (Android ${_android_arch})"
url='https://github.com/libass/libass/'
license=('BSD')
groups=('android-libass')
depends=("android-${_android_arch}-fontconfig"
         "android-${_android_arch}-fribidi"
         "android-${_android_arch}-harfbuzz"
         "android-${_android_arch}-freetype2"
         "android-${_android_arch}-libunibreak")
makedepends=('android-configure'
             'nasm')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/libass/libass/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('bc419d8ba51f23790eb423e88d3fbe6e')
validpgpkeys=(
    '5458C3100671F252B0F4C7708079D18C21AAAAFF' # Oleg Oshmyan (Chortos-2) <chortos@inbox.lv>
    '5EE63F2A71BF132CFE3567E1DFFE615F2824C720' # Oneric <oneric@oneric.de>
)

prepare() {
    cd "${srcdir}/libass-${pkgver}"
    source android-env ${_android_arch}

    ./autogen.sh
}

build() {
    cd "${srcdir}/libass-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --enable-fontconfig \
        --enable-libunibreak
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libass-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
