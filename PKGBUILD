# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: drakkan <nicola.murino at gmail dot com>

_android_arch=x86-64

pkgname=android-${_android_arch}-pcre2
pkgver=10.42
pkgrel=1
pkgdesc="A library that implements Perl 5-style regular expressions (android)"
arch=(any)
url="http://www.pcre.org/"
license=("BSD")
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-configure'
             "android-${_android_arch}-bzip2"
             "android-${_android_arch}-readline"
             "android-${_android_arch}-zlib")
source=("https://github.com/PhilipHazel/pcre2/releases/download/pcre2-$pkgver/pcre2-$pkgver.tar.bz2"{,.sig})
validpgpkeys=('45F68D54BBE23FB3039B46E59766E084FB0F43D8') # Philip Hazel
sha512sums=('72fbde87fecec3aa4b47225dd919ea1d55e97f2cbcf02aba26e5a0d3b1ffb58c25a80a9ef069eb99f9cf4e41ba9604ad06a7ec159870e1e875d86820e12256d3'
            'SKIP')

build() {
    cd "${srcdir}"/pcre2-${pkgver}
    source android-env ${_android_arch}

    export LIBS="${LIBS} -L${ANDROID_PREFIX_LIB}"
    export CFLAGS="${CFLAGS} -I${ANDROID_PREFIX_INCLUDE}"
    export CPPFLAGS="${CPPFLAGS} -I${ANDROID_PREFIX_INCLUDE}"

    android-${_android_arch}-configure \
        --enable-jit \
        --enable-pcre2-16 \
        --enable-pcre2-32 \
        --enable-pcre2grep-libz \
        --enable-pcre2grep-libbz2 \
        --enable-pcre2test-libreadline

    make $MAKEFLAGS
}

package() {
    cd "${srcdir}"/pcre2-${pkgver}
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}"/${ANDROID_PREFIX_BIN}
    rm -r "${pkgdir}"/${ANDROID_PREFIX_SHARE}
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
