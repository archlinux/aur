# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_android_arch=x86

pkgname=android-${_android_arch}-libxext
pkgver=1.3.6
pkgrel=2
arch=('any')
pkgdesc="X11 miscellaneous extensions library (Android ${_android_arch})"
url="https://gitlab.freedesktop.org/xorg/lib/libxext"
license=('LicenseRef-libxext')
groups=("android-libxext")
depends=("android-${_android_arch}-libx11"
         "android-${_android_arch}-xorgproto")
makedepends=("android-${_android_arch}-xorg-util-macros")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://xorg.freedesktop.org/releases/individual/lib/libXext-${pkgver}.tar.xz"{,.sig})
md5sums=('e59476db179e48c1fb4487c12d0105d1'
         'SKIP')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # Alan Coopersmith <alan.coopersmith@oracle.com>

build() {
    cd "$srcdir/libXext-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --sysconfdir=${ANDROID_PREFIX_ETC} \
        --disable-malloc0returnsnull
    make $MAKEFLAGS
}

package() {
    cd "$srcdir/libXext-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
