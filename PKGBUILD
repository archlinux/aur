# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Daniel Kirchner <daniel AT ekpyron DOT org>

_android_arch=x86

pkgname=android-${_android_arch}-libpng
pkgver=1.6.37
pkgrel=4
pkgdesc="A collection of routines used to create PNG format graphics (android)"
arch=('any')
url="http://www.libpng.org/pub/png/libpng.html"
license=('custom')
depends=("android-${_android_arch}-zlib")
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-configure')
source=("http://downloads.sourceforge.net/sourceforge/libpng/libpng-$pkgver.tar.xz"
        "http://downloads.sourceforge.net/project/apng/libpng/libpng16/libpng-$pkgver-apng.patch.gz")
sha256sums=('505e70834d35383537b6491e7ae8641f1a4bed1876dbfe361201fc80868d88ca'
            '10d9e0cb60e2b387a79b355eb7527c0bee2ed8cbd12cf04417cabc4d6976683c')

prepare() {
    cd "$srcdir/libpng-$pkgver"
    source android-env ${_android_arch}

    # Add animated PNG (apng) support
    # see http://sourceforge.net/projects/libpng-apng/
    gzip -dkf ../libpng-$pkgver-apng.patch.gz
    patch -Np0 -i ../libpng-$pkgver-apng.patch
    sed -i "s/libpng@PNGLIB_MAJOR@@PNGLIB_MINOR@/libpng/g" libpng.pc.in
    sed -i "s/-lpng@PNGLIB_MAJOR@@PNGLIB_MINOR@/\-lpng/g" libpng.pc.in
    sed -i "s/libpng@PNGLIB_MAJOR@@PNGLIB_MINOR@/libpng/g" Makefile.in
}

build() {
    cd "$srcdir/libpng-$pkgver"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --disable-unversioned-links \
        --disable-unversioned-libpng-pc \
        --disable-unversioned-libpng-config

    make $MAKEFLAGS
}

package () {
    cd "${srcdir}/libpng-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    sed -i "s|include/libpng|include|g" "${pkgdir}"/${ANDROID_PREFIX_LIB}/pkgconfig/libpng.pc
    rm -r "${pkgdir}"/${ANDROID_PREFIX_BIN}
    rm -r "${pkgdir}"/${ANDROID_PREFIX_SHARE}
    mv -f "${pkgdir}"/${ANDROID_PREFIX_INCLUDE}/libpng/* "${pkgdir}"/${ANDROID_PREFIX_INCLUDE}/
    rm -r "${pkgdir}"/${ANDROID_PREFIX_INCLUDE}/libpng
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
