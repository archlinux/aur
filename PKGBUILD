# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Eric Bélanger <eric@archlinux.org>

_android_arch=aarch64

pkgname=android-${_android_arch}-libwmf
pkgver=0.2.13
pkgrel=3
arch=('any')
pkgdesc="A library for reading vector images in Microsoft's native Windows Metafile Format (WMF) (Android ${_android_arch})"
url="http://wvware.sourceforge.net/libwmf.html"
license=('LGPL')
groups=(android-libwmf)
depends=("android-${_android_arch}-libx11"
         "android-${_android_arch}-libjpeg"
         "android-${_android_arch}-freetype2"
         "android-${_android_arch}-expat")
makedepends=('android-configure'
             "android-${_android_arch}-libxt")
optdepends=("android-${_android_arch}-gdk-pixbuf2: for pixbuf loader")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/caolanm/libwmf/archive/v${pkgver}.tar.gz")
sha256sums=('18ba69febd2f515d98a2352de284a8051896062ac9728d2ead07bc39ea75a068')

prepare() {
    cd "${srcdir}/libwmf-${pkgver}"
    source android-env ${_android_arch}

    autoreconf -fiv
}

build() {
    cd "${srcdir}/libwmf-${pkgver}"
    source android-env ${_android_arch}

    export CFLAGS="${CFLAGS} -I${ANDROID_PREFIX_INCLUDE}/libpng"
    export LDFLAGS="${LDFLAGS} -L\"${PWD}/src/.libs\""

    android-${_android_arch}-configure \
        --with-pic
     make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libwmf-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -f "${pkgdir}/${ANDROID_PREFIX_BIN}/"{wmf2eps,wmf2fig,wmf2gd,wmf2svg,wmf2x}
    find "${pkgdir}/${ANDROID_PREFIX_LIB}" -type f -name '*.so' -exec ${ANDROID_STRIP} -g --strip-unneeded {} \;
    find "${pkgdir}/${ANDROID_PREFIX_LIB}" -type f -name '*.a' -exec ${ANDROID_STRIP} -g {} \;
}
