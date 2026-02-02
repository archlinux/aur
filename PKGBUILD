# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_android_arch=riscv64

pkgname=android-${_android_arch}-libxmu
pkgver=1.3.1
pkgrel=1
arch=('any')
pkgdesc="X11 miscellaneous micro-utility library (Android ${_android_arch})"
url="https://gitlab.freedesktop.org/xorg/lib/libxmu"
license=('MIT-open-group AND SMLNJ AND X11 AND ISC')
groups=('android-libxmu')
depends=("android-${_android_arch}-libxext"
         "android-${_android_arch}-libxt"
         "android-${_android_arch}-libx11"
         "android-${_android_arch}-xorgproto")
makedepends=('android-configure'
             "android-${_android_arch}-xorg-util-macros")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://xorg.freedesktop.org//archive/individual/lib/libXmu-${pkgver}.tar.xz")
md5sums=('1ef8065f0284e76c2238770365012ab2')

build() {
    cd "${srcdir}/libXmu-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --sysconfdir="${ANDROID_PREFIX_ETC}"
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libXmu-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "$pkgdir/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a

    install -vDm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
