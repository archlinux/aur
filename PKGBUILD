# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Daniel Kirchner <daniel AT ekpyron DOT org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libpng
pkgver=1.6.43
pkgrel=1
pkgdesc="A collection of routines used to create PNG format graphics (Android ${_android_arch})"
arch=('any')
url="http://www.libpng.org/pub/png/libpng.html"
license=('custom')
depends=("android-${_android_arch}-zlib")
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-configure')
source=("http://downloads.sourceforge.net/sourceforge/libpng/libpng-$pkgver.tar.xz"
        '0001-Disable-zlib-version-check.patch')
md5sums=('22b8362d16c3724eba9c1fb8d187320a'
         '02be00cae20d83569e60fffd98047d1b')

prepare() {
    cd "$srcdir/libpng-$pkgver"

    patch -Np1 -i ../0001-Disable-zlib-version-check.patch
}

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
