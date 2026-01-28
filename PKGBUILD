# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_android_arch=riscv64

pkgname=android-${_android_arch}-libxext
pkgver=1.3.7
pkgrel=1
arch=('any')
pkgdesc="X11 miscellaneous extensions library (Android ${_android_arch})"
url="https://gitlab.freedesktop.org/xorg/lib/libxext"
license=('LicenseRef-libxext')
groups=("android-libxext")
depends=("android-${_android_arch}-libx11"
         "android-${_android_arch}-xorgproto")
makedepends=("android-${_android_arch}-xorg-util-macros")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://xorg.freedesktop.org/releases/individual/lib/libXext-${pkgver}.tar.xz")
md5sums=('ea8149187a26e9df6dbd94a60b3d8da0')

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

    install -vDm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
