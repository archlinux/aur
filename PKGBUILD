# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: David Runge <dvzrv@archlinux.org>

_android_arch=aarch64

pkgname=android-${_android_arch}-zix
pkgver=0.4.2
pkgrel=1
arch=('any')
pkgdesc="A lightweight C99 portability and data structure library (Android ${_android_arch})"
url="https://gitlab.com/drobilla/zix"
license=('0BSD OR ISC')
depends=('android-ndk')
makedepends=('android-meson')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://download.drobilla.net/zix-$pkgver.tar.xz"{,.sig})
md5sums=('87999e25b0440789d1a8325b00a02ed4'
         'SKIP')
validpgpkeys=('907D226E7E13FA337F014A083672782A9BF368F3') # David Robillard <d@drobilla.net>

build() {
    cd "${srcdir}/zix-${pkgver}"
    source android-env ${_android_arch}

    mkdir -p build
    cd build
    android-${_android_arch}-meson \
        --default-library both \
        -D benchmarks=disabled  \
        -D docs=disabled \
        -D html=disabled  \
        -D lint=false \
        -D singlehtml=disabled \
        -D tests=disabled \
        -D tests_cpp=disabled
    ninja
}

package() {
    cd "${srcdir}/zix-${pkgver}/build"
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" ninja install
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a || true
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_RANLIB} "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a || true
}
