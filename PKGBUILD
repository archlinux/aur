# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: drakkan <nicola.murino at gmail dot com>

_android_arch=x86-64

pkgname=android-${_android_arch}-pcre
pkgver=8.45
pkgrel=3
pkgdesc="A library that implements Perl 5-style regular expressions (Android ${_android_arch})"
arch=('any')
url="http://www.pcre.org/"
license=("BSD")
groups=('android-pcre')
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-configure'
             "android-${_android_arch}-bzip2"
             "android-${_android_arch}-zlib")
optdepends=("android-${_android_arch}-bzip2"
             "android-${_android_arch}-zlib")
source=("http://downloads.sourceforge.net/pcre/pcre-${pkgver}.tar.bz2"{,.sig}
        '0001-Add-riscv64-support.patch'
        '0001-Remove-arch-restrictions.patch')
validpgpkeys=('45F68D54BBE23FB3039B46E59766E084FB0F43D8') # Philip Hazel
md5sums=('4452288e6a0eefb2ab11d36010a1eebb'
         'SKIP'
         '4c20c5f8250090062a2bba23459a007c'
         '18e9da1810e8fde1ce9009fc4c1b3c12')

prepare() {
    cd "${srcdir}/pcre-${pkgver}"

    patch -Np1 -i ../0001-Add-riscv64-support.patch
    #patch -Np1 -i ../0001-Remove-arch-restrictions.patch
}

build() {
    cd "${srcdir}/pcre-${pkgver}"
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
    cd "${srcdir}/pcre-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}/${ANDROID_PREFIX_BIN}"
    rm -r "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
