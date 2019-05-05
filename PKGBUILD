# PKGBUILD for android-lame
# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=aarch64
source android-env.sh ${_android_arch}

pkgname=android-${_android_arch}-lame
pkgver=3.100
pkgrel=4
pkgdesc="A high quality MPEG Audio Layer III (MP3) encoder (android)"
arch=('any')
url="http://lame.sourceforge.net/"
license=('LGPL')
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-pkg-config' 'nasm')
source=("http://downloads.sourceforge.net/lame/lame-$pkgver.tar.gz")
md5sums=('83e260acbe4389b54fe08e0bdbf7cddb')

prepare() {
    check_ndk_version_ge_than 18.0
}

build() {
    cd "${srcdir}"/lame-${pkgver}

    export CC=${ANDROID_CC}
    export CXX=${ANDROID_CXX}
    export PKG_CONFIG=${ANDROID_PKGCONFIG}
    target=${_android_arch/x86-/x86_}-linux-android

    ./configure \
        --host=${target} \
        --target=${target} \
        --build="$CHOST" \
        --prefix=${ANDROID_LIBS} \
        --libdir=${ANDROID_LIBS}/lib \
        --includedir=${ANDROID_LIBS}/include \
        --enable-shared \
        --enable-static \
        --disable-frontend \
        --enable-nasm

    make $MAKEFLAGS
}

package() {
    cd "${srcdir}"/lame-${pkgver}

    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}"/${ANDROID_LIBS}/share
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_LIBS}/lib/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_LIBS}/lib/*.a
}
