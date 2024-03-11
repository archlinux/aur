# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

_android_arch=aarch64

pkgname=android-${_android_arch}-libx11
pkgver=1.8.7
pkgrel=2
arch=('any')
pkgdesc="X11 client-side library (Android, ${_android_arch})"
url="https://xorg.freedesktop.org/"
license=('custom')
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
sha512sums=('d53bfc18f38d339a6a695b09835b2ae96b323881678bfe7ddca697605e3bdf4102ff49cc3078880a6c55b5977fcdd0aadaf5429086132de3a5bda302f79a2fa6'
            'SKIP'
            'ff37be288378b1b0023f754ff52ec8b41bf3f1b0fc9d1f21f79472ea145172cee50211f1fbbf8de2c58693577e21e4fe70f6820d1d7ad3914a6f5e0d08e08bee')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # Alan Coopersmith <alanc@freedesktop.org>

prepare() {
    cd "$srcdir/libX11-${pkgver}"
    patch -Np1 -i ../0001-Fix-missing-symbols.patch
}

build() {
    cd "$srcdir/libX11-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --disable-xf86bigfont \
        --disable-malloc0returnsnull \
        --disable-xthreads
    make $MAKEFLAGS
}

package() {
    cd "$srcdir/libX11-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}/doc"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}/man"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
