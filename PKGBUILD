# PKGBUILD for android-opus
# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=x86-64
source android-env.sh ${_android_arch}

pkgname=android-${_android_arch}-opus
pkgver=1.3.1
pkgrel=1
pkgdesc="Codec designed for interactive speech and audio transmission over the Internet (android)"
arch=('any')
url="http://www.opus-codec.org"
license=("BSD")

if [ -z "${ANDROID_NO_DEPS}" ]; then
    depends=('android-ndk')
fi

options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-pkg-config')
source=("http://downloads.us.xiph.org/releases/opus/opus-$pkgver.tar.gz")
sha256sums=('65b58e1e25b2a114157014736a3d9dfeaad8d41be1c8179866f144a2fb44ff9d')

prepare() {
    check_ndk_version_ge_than 18.0
}

build() {
    cd "${srcdir}"/opus-${pkgver}

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
        --enable-custom-modes \
        --disable-doc

    make $MAKEFLAGS
}

package() {
    cd "${srcdir}"/opus-${pkgver}

    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}"/${ANDROID_LIBS}/share
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_LIBS}/lib/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_LIBS}/lib/*.a
}
