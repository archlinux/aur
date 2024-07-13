# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Daniel Kirchner <daniel AT ekpyron DOT org>

_android_arch=x86

pkgname=android-${_android_arch}-libpng
pkgver=1.6.43
pkgrel=2
pkgdesc="A collection of routines used to create PNG format graphics (Android ${_android_arch})"
arch=('any')
url="http://www.libpng.org/pub/png/libpng.html"
license=('custom')
depends=("android-${_android_arch}-zlib")
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-configure')
source=("http://downloads.sourceforge.net/sourceforge/libpng/libpng-${pkgver}.tar.xz"
        '0001-Disable-zlib-version-check.patch')
md5sums=('22b8362d16c3724eba9c1fb8d187320a'
         '02be00cae20d83569e60fffd98047d1b')

prepare() {
    cd "${srcdir}/libpng-${pkgver}"

    patch -Np1 -i ../0001-Disable-zlib-version-check.patch

    sed -i 's|PNGLIB_BASENAME = libpng@PNGLIB_MAJOR@@PNGLIB_MINOR@|PNGLIB_BASENAME = libpng|g' Makefile.in
    sed -i 's|libpng@PNGLIB_MAJOR@@PNGLIB_MINOR@.la|libpng.la|g' Makefile.in
    sed -i 's|libpng@PNGLIB_MAJOR@@PNGLIB_MINOR@-config|libpng-config|g' Makefile.in
    sed -i 's|libpng@PNGLIB_MAJOR@@PNGLIB_MINOR@.pc|libpng.pc|g' Makefile.in
    sed -i 's|@PNGLIB_MAJOR@@PNGLIB_MINOR@||g' libpng.pc.in
    sed -i 's|@PNGLIB_MAJOR@@PNGLIB_MINOR@||g' libpng-config.in
}

build() {
    cd "${srcdir}/libpng-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --disable-tests \
        --disable-tools \
        --disable-unversioned-links \
        --disable-unversioned-libpng-pc\
        --disable-unversioned-libpng-config \
        --enable-hardware-optimizations
    make $MAKEFLAGS
}

package () {
    cd "${srcdir}/libpng-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
