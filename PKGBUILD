# PKGBUILD for android-speexdsp
# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=armv7a-eabi
source android-env.sh ${_android_arch}

pkgname=android-${_android_arch}-speexdsp
pkgver=1.2rc3
pkgrel=2
pkgdesc="DSP library derived from Speex (android)"
arch=(any)
url="http://www.speexdsp.org"
license=("BSD")
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-pkg-config')
source=("http://downloads.xiph.org/releases/speex/speexdsp-$pkgver.tar.gz")
md5sums=('70d9d31184f7eb761192fd1ef0b73333')

prepare() {
    check_ndk_version_ge_than 18.0
}

build() {
    cd "${srcdir}"/speexdsp-${pkgver}

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
        --disable-neon

    make $MAKEFLAGS
}

package() {
    cd "${srcdir}"/speexdsp-${pkgver}

    make DESTDIR="$pkgdir" install

    for f in $(find "$pkgdir/${ANDROID_LIBS}/lib" -type l -name "lib*.so"); do
        echo HOLA "$f"
        mv -vf "$(realpath "$f")" "$f"
    done

    rm -vf "$pkgdir"/${ANDROID_LIBS}/lib/lib*.so.*
    rm -r "${pkgdir}"/${ANDROID_LIBS}/share
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_LIBS}/lib/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_LIBS}/lib/*.a
}
