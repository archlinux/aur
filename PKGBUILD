# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=x86-64
source android-env ${_android_arch}

pkgname=android-${_android_arch}-xz
pkgver=5.2.4
pkgrel=2
pkgdesc="Library and command line tools for XZ and LZMA compressed files (android)"
arch=('any')
url="https://tukaani.org/xz"
license=('custom' 'GPL' 'LGPL')
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-configure')
source=("${url}/xz-${pkgver}.tar.gz")
sha256sums=('b512f3b726d3b37b6dc4c8570e137b9311e7552e8ccbab4d39d47ce5f4177145')

prepare() {
    check_ndk_version_ge_than 18.0
}

build() {
    cd "${srcdir}"/xz-${pkgver}

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

    make DESTDIR="$pkgdir" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
