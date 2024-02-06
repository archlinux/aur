# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Daniel Kirchner <daniel AT ekpyron DOT org>

_android_arch=aarch64

pkgname=android-${_android_arch}-libpng
pkgver=1.6.42
pkgrel=1
pkgdesc="A collection of routines used to create PNG format graphics (android)"
arch=('any')
url="http://www.libpng.org/pub/png/libpng.html"
license=('custom')
depends=("android-${_android_arch}-zlib")
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-configure')
source=("http://downloads.sourceforge.net/sourceforge/libpng/libpng-$pkgver.tar.xz")
sha256sums=('c919dbc11f4c03b05aba3f8884d8eb7adfe3572ad228af972bb60057bdb48450')

build() {
    cd "$srcdir/libpng-$pkgver"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --enable-unversioned-links \
        --enable-unversioned-libpng-pc\
        --enable-unversioned-libpng-config \
        --enable-hardware-optimizations

    make $MAKEFLAGS
}

package () {
    cd "${srcdir}/libpng-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    sed -i "s|include/libpng|include|g" "${pkgdir}"/${ANDROID_PREFIX_LIB}/pkgconfig/libpng.pc
    rm -r "${pkgdir}"/${ANDROID_PREFIX_BIN}
    rm -r "${pkgdir}"/${ANDROID_PREFIX_SHARE}
    mv -f "${pkgdir}"/${ANDROID_PREFIX_INCLUDE}/libpng16/ "${pkgdir}"/${ANDROID_PREFIX_INCLUDE}/libpng/
    rm -f "${pkgdir}"/${ANDROID_PREFIX_INCLUDE}/*.h
    rm -f "${pkgdir}"/${ANDROID_PREFIX_LIB}/libpng.{a,so}
    mv -f "${pkgdir}"/${ANDROID_PREFIX_LIB}/libpng16.a "${pkgdir}"/${ANDROID_PREFIX_LIB}/libpng.a
    mv -f "${pkgdir}"/${ANDROID_PREFIX_LIB}/libpng16.so "${pkgdir}"/${ANDROID_PREFIX_LIB}/libpng.so
    rm -f "${pkgdir}"/${ANDROID_PREFIX_LIB}/pkgconfig/libpng16.pc
    sed -i 's|include16|include/libpng|g' "${pkgdir}"/${ANDROID_PREFIX_LIB}/pkgconfig/libpng.pc
    sed -i 's|lpng16|lpng|g' "${pkgdir}"/${ANDROID_PREFIX_LIB}/pkgconfig/libpng.pc
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
