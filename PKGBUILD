# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Panagiotis Papadopoulos pano_90 AT gmx DOT net

_android_arch=x86-64

pkgname=android-${_android_arch}-libbs2b
pkgver=3.1.0
pkgrel=2
arch=('any')
pkgdesc="Bauer stereophonic-to-binaural DSP effect library (Android ${_android_arch})"
url="http://bs2b.sourceforge.net"
license=('custom:MIT')
depends=("android-${_android_arch}-libsndfile")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://downloads.sourceforge.net/sourceforge/bs2b/libbs2b-$pkgver.tar.lzma"
        'formatsecurity.diff')
md5sums=('00d32ffa6461dde6a632c846da3e0a13'
         'af1c91f47bd7481cd71fc38a3a35f0e7')

prepare() {
    cd "${srcdir}/libbs2b-${pkgver}"
    source android-env ${_android_arch}

    # Fix error: format not a string literal and no format arguments [-Werror=format-security]
    patch -Np1 -i ../formatsecurity.diff

    sed -i 's/dist-lzma/dist-xz/g' configure.ac

    autoreconf -fvi
}

build() {
    cd "${srcdir}/libbs2b-${pkgver}"
    source android-env ${_android_arch}

    export ac_cv_func_malloc_0_nonnull=yes

    android-${_android_arch}-configure
    sed -i 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libbs2b-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
