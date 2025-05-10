# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=x86

pkgname=android-${_android_arch}-xz
pkgver=5.8.1
pkgrel=1
arch=('any')
pkgdesc="Library and command line tools for XZ and LZMA compressed files (Android ${_android_arch})"
url="https://tukaani.org/xz"
license=('custom' 'GPL' 'LGPL')
groups=('android-xz')
depends=('android-ndk')
makedepends=('android-configure'
             'android-sdk-build-tools'
             'po4a'
             'doxygen')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/tukaani-project/xz/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('1be5d8137d7b5e91fa9ff8a6fdc4895b')

prepare() {
    cd "${srcdir}/xz-${pkgver}"
    source android-env ${_android_arch}

    check_ndk_version_ge_than 18.0
    ./autogen.sh
}

build() {
    cd "${srcdir}/xz-${pkgver}"
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
    cd "${srcdir}/xz-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
