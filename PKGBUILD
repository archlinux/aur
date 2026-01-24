# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: drakkan <nicola.murino at gmail dot com>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-pcre2
pkgver=10.47
pkgrel=1
arch=('any')
pkgdesc="A library that implements Perl 5-style regular expressions (Android ${_android_arch})"
url="http://www.pcre.org/"
license=("BSD")
groups=('android-pcre2')
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-configure'
             "android-${_android_arch}-bzip2"
             "android-${_android_arch}-readline"
             "android-${_android_arch}-zlib")
source=("https://github.com/PhilipHazel/pcre2/releases/download/pcre2-${pkgver}/pcre2-${pkgver}.tar.bz2")
md5sums=('aded5840ab5a7d772dd4e16fc294b665')

build() {
    cd "${srcdir}/pcre2-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --enable-jit \
        --enable-pcre2-16 \
        --enable-pcre2-32 \
        --enable-pcre2grep-libz \
        --enable-pcre2grep-libbz2 \
        --enable-pcre2test-libreadline \
        --enable-symvers=no
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/pcre2-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}/${ANDROID_PREFIX_BIN}"
    rm -r "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a

    install -vDm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
