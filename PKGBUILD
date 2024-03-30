# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=x86

pkgname=android-${_android_arch}-xz
pkgver=5.6.1
_pkgrver=5.4.5
pkgrel=2
arch=('any')
pkgdesc="Library and command line tools for XZ and LZMA compressed files (Android ${_android_arch})"
url="https://tukaani.org/xz"
license=('custom' 'GPL' 'LGPL')
depends=('android-ndk')
makedepends=('android-configure'
             'android-sdk-build-tools'
             'po4a'
             'doxygen')
options=(!strip !buildflags staticlibs !emptydirs)
source=("http://deb.debian.org/debian/pool/main/x/xz-utils/xz-utils_${pkgver}+really${_pkgrver}.orig.tar.xz")
md5sums=('1d33e0be05c53e7a5641acf5c8b35fdd')

prepare() {
    cd "${srcdir}/xz-${_pkgrver}"
    source android-env ${_android_arch}

    check_ndk_version_ge_than 18.0
    ./autogen.sh
}

build() {
    cd "${srcdir}/xz-${_pkgrver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --disable-xz \
        --disable-xzdec \
        --disable-lzmadec \
        --disable-lzmainfo \
        --disable-lzma-links \
        --disable-scripts \
        --disable-doc
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/xz-${_pkgrver}"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
