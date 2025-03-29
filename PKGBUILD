# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_android_arch=riscv64

pkgname=android-${_android_arch}-libsm
pkgver=1.2.6
pkgrel=1
arch=('any')
pkgdesc="X11 Session Management library (Android ${_android_arch})"
license=('custom')
url="https://xorg.freedesktop.org/"
groups=('android-libsm')
depends=("android-${_android_arch}-libice")
makedepends=("android-configure"
             "android-${_android_arch}-xorg-util-macros"
             "android-${_android_arch}-xtrans"
             "android-${_android_arch}-xorgproto")
options=(!strip !buildflags staticlibs !emptydirs)
source=("${url}/releases/individual/lib/libSM-${pkgver}.tar.xz"{,.sig})
md5sums=('3aeeea05091db1c69e6f768e0950a431'
         'SKIP')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # Alan Coopersmith <alanc@freedesktop.org>

build() {
    cd "${srcdir}/libSM-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --sysconfdir="${ANDROID_PREFIX_ETC}"
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libSM-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
