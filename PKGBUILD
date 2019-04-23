# PKGBUILD for android-libtheora
# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=aarch64
source android-env.sh ${_android_arch}

pkgname=android-${_android_arch}-libtheora
pkgver=1.1.1
pkgrel=1
pkgdesc="An open video codec developed by the Xiph.org (android)"
arch=('any')
url="http://xiph.org"
license=("BSD")
depends=("android-${_android_arch}-libvorbis")
makedepends=('android-pkg-config')
options=(!strip !buildflags staticlibs)
source=("http://downloads.xiph.org/releases/theora/libtheora-${pkgver}.tar.bz2")
md5sums=('292ab65cedd5021d6b7ddd117e07cd8e')

prepare() {
    cd "${srcdir}"/libtheora-${pkgver}

    autoreconf -fi -I m4
}

build() {
    cd "${srcdir}"/libtheora-${pkgver}

    export CC=${ANDROID_CC}
    export CXX=${ANDROID_CXX}
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
        --disable-examples

    make $MAKEFLAGS
}

package() {
    cd "${srcdir}"/libtheora-${pkgver}

    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}"/${ANDROID_LIBS}/share
    ${ANDROID_STRIP} --strip-unneeded "${pkgdir}"/${ANDROID_LIBS}/lib/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_LIBS}/lib/*.a
}
