# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Daniel Kirchner <daniel AT ekpyron DOT org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libpng
pkgver=1.6.58
pkgrel=1
pkgdesc="A collection of routines used to create PNG format graphics (Android ${_android_arch})"
arch=('any')
url="http://www.libpng.org/pub/png/libpng.html"
license=('custom')
groups=('android-libpng')
depends=("android-${_android_arch}-zlib")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("http://downloads.sourceforge.net/sourceforge/libpng/libpng-${pkgver}.tar.xz")
md5sums=('c6c372a9d7754c66e0b77a8d34987a3b')

build() {
    cd "${srcdir}/libpng-${pkgver}"
    source android-env ${_android_arch}

    export CFLAGS="${CFLAGS} -fPIC"
    export CXXFLAGS="${CXXFLAGS} -fPIC"

    android-${_android_arch}-configure \
        --disable-tests \
        --disable-tools \
        --enable-hardware-optimizations
    make $MAKEFLAGS
}

package () {
    cd "${srcdir}/libpng-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a

    install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
