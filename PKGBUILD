# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

_android_arch=aarch64

pkgname=android-${_android_arch}-libx11
pkgver=1.8.10
pkgrel=1
arch=('any')
pkgdesc="X11 client-side library (Android ${_android_arch})"
url="https://xorg.freedesktop.org/"
license=('custom')
groups=('android-libx11')
# keep xorgproto runtime dependency
# https://lists.archlinux.org/pipermail/arch-dev-public/2019-December/029767.html
depends=("android-${_android_arch}-libxcb"
         "android-${_android_arch}-xorgproto")
makedepends=('android-configure'
             "android-${_android_arch}-xorg-util-macros"
             "android-${_android_arch}-xtrans")
options=(!strip !buildflags staticlibs !emptydirs)
source=("${url}/releases/individual/lib/libX11-${pkgver}.tar.xz"{,.sig}
        '0001-Fix-missing-symbols.patch')
md5sums=('5b8fa54e0ef94136b56f887a5e6cf6c9'
         'SKIP'
         '7aa12ed8ce6ef220c1e0b8c2b2982d27')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # Alan Coopersmith <alanc@freedesktop.org>

prepare() {
    cd "$srcdir/libX11-${pkgver}"

    patch -Np1 -i ../0001-Fix-missing-symbols.patch

    sed -i 's|-lpthread| |g' configure
}

build() {
    cd "$srcdir/libX11-${pkgver}"
    source android-env ${_android_arch}

    export CFLAGS="${CFLAGS} -DNO_DEC_I18N_FIX"
    export CXXFLAGS="${CXXFLAGS} -DNO_DEC_I18N_FIX"

    android-${_android_arch}-configure \
        --disable-xf86bigfont \
        --disable-malloc0returnsnull
    make $MAKEFLAGS
}

package() {
    cd "$srcdir/libX11-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}/doc"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}/man"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
