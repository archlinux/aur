# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=x86-64

pkgname=android-${_android_arch}-xz
pkgver=5.2.5
pkgrel=1
pkgdesc="Library and command line tools for XZ and LZMA compressed files (android)"
arch=('any')
url="https://tukaani.org/xz"
license=('custom' 'GPL' 'LGPL')
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-configure')
source=("${url}/xz-${pkgver}.tar.gz")
sha256sums=('f6f4910fd033078738bd82bfba4f49219d03b17eb0794eb91efbae419f4aba10')

prepare() {
    source android-env ${_android_arch}
    check_ndk_version_ge_than 18.0
}

build() {
    cd "${srcdir}"/xz-${pkgver}
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
    cd "${srcdir}"/xz-${pkgver}
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
