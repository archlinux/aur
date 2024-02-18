# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: drakkan <nicola.murino at gmail dot com>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libidn2
pkgver=2.3.7
pkgrel=1
arch=('any')
pkgdesc="A free software implementation of IDNA2008 (android)"
url="http://www.gnu.org/software/libidn"
license=("GPL3, LGPL3")
depends=("android-${_android_arch}-libunistring")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://ftp.gnu.org/pub/gnu/libidn/libidn2-${pkgver}.tar.gz")
sha256sums=('4c21a791b610b9519b9d0e12b8097bf2f359b12f8dd92647611a929e6bfd7d64')

build() {
    cd "${srcdir}/libidn2-${pkgver}"
    source android-env ${_android_arch}

    export CFLAGS+=" -D__USE_FORTIFY_LEVEL=2"
    export CXXFLAGS+=" -D__USE_FORTIFY_LEVEL=2"
    export LDFLAGS+=" -Wl,--undefined-version"

    extra_opts=

    # Platform specific patches
    case "$_android_arch" in
        aarch64)
            extra_opts=--with-included-libunistring
            ;;
        *)
            ;;
    esac

    android-${_android_arch}-configure \
        ${extra_opts} \
        --disable-doc
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libidn2-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -rf "$pkgdir/${ANDROID_PREFIX_BIN}"
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a || true
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
}
