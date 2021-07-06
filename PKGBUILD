# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: drakkan <nicola.murino at gmail dot com>

_android_arch=x86

pkgname=android-${_android_arch}-pcre
pkgver=8.45
pkgrel=1
pkgdesc="A library that implements Perl 5-style regular expressions (android)"
arch=(any)
url="http://www.pcre.org/"
license=("BSD")
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-configure'
             "android-${_android_arch}-bzip2"
             "android-${_android_arch}-zlib")
optdepends=("android-${_android_arch}-bzip2"
             "android-${_android_arch}-zlib")
source=("https://ftp.pcre.org/pub/pcre/pcre-$pkgver.tar.bz2"{,.sig})
validpgpkeys=('45F68D54BBE23FB3039B46E59766E084FB0F43D8') # Philip Hazel
md5sums=('4452288e6a0eefb2ab11d36010a1eebb'
         'SKIP')

build() {
    cd "${srcdir}"/pcre-${pkgver}
    source android-env ${_android_arch}

    export LIBS="-L${ANDROID_PREFIX_LIB}"
    export CPPFLAGS="-I${ANDROID_PREFIX_INCLUDE}"

    android-${_android_arch}-configure \
      --enable-jit \
      --enable-pcre16 \
      --enable-pcre32 \
      --enable-pcregrep-libz \
      --enable-pcregrep-libbz2
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}"/pcre-${pkgver}
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}"/${ANDROID_PREFIX_BIN}
    rm -r "${pkgdir}"/${ANDROID_PREFIX_SHARE}
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
