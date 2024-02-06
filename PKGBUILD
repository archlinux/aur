# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=aarch64

pkgname=android-${_android_arch}-xz
pkgver=5.4.6
pkgrel=1
pkgdesc="Library and command line tools for XZ and LZMA compressed files (android)"
arch=('any')
url="https://tukaani.org/xz"
license=('custom' 'GPL' 'LGPL')
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-configure' 'android-sdk-build-tools' 'po4a' 'doxygen')
source=("https://github.com/tukaani-project/xz/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('b7851aa372c79bba2520f0fbaa562acb')

prepare() {
    source android-env ${_android_arch}
    check_ndk_version_ge_than 18.0
}

build() {
    cd "${srcdir}"/xz-${pkgver}
    source android-env ${_android_arch}

    ./autogen.sh
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
    cd "${srcdir}"/xz-${pkgver}
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
