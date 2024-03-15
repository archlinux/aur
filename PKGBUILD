# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: drakkan <nicola.murino at gmail dot com>

_android_arch=aarch64

pkgname=android-${_android_arch}-pcre2
pkgver=10.43
pkgrel=1
arch=('any')
pkgdesc="A library that implements Perl 5-style regular expressions (Android, ${_android_arch})"
url="http://www.pcre.org/"
license=("BSD")
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-configure'
             "android-${_android_arch}-bzip2"
             "android-${_android_arch}-readline"
             "android-${_android_arch}-zlib")
source=("https://github.com/PhilipHazel/pcre2/releases/download/pcre2-$pkgver/pcre2-$pkgver.tar.bz2")
md5sums=('c8e2043cbc4abb80e76dba323f7c409f')

build() {
    cd "${srcdir}/pcre2-${pkgver}"
    source android-env ${_android_arch}

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
    cd "${srcdir}/pcre2-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}/${ANDROID_PREFIX_BIN}"
    rm -r "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
