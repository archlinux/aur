# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_android_arch=aarch64

pkgname=android-${_android_arch}-libxext
pkgver=1.3.6
pkgrel=1
arch=('any')
pkgdesc="X11 miscellaneous extensions library (android)"
url="https://gitlab.freedesktop.org/xorg/lib/libxext"
license=('LicenseRef-libxext')
depends=("android-${_android_arch}-libx11"
         "android-${_android_arch}-xorgproto")
makedepends=("android-${_android_arch}-xorg-util-macros")
options=(!strip !buildflags staticlibs !emptydirs)
source=(https://xorg.freedesktop.org/releases/individual/lib/libXext-${pkgver}.tar.xz{,.sig})
sha512sums=('fd7693b5698cc4f5e80002a2cd4bd88e5d52c755c19a0417ee73029bd65f9d77b0969e765a1febc4d8fce1ba5dfb7278717f47be742e33d8fc5eb941e769792e'
            'SKIP')
validpgpkeys+=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # Alan Coopersmith <alan.coopersmith@oracle.com>

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
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
