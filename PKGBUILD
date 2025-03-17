# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: David Runge <dvzrv@archlinux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-zix
pkgver=0.6.2
pkgrel=1
arch=('any')
pkgdesc="A lightweight C99 portability and data structure library (Android ${_android_arch})"
url="https://gitlab.com/drobilla/zix"
license=('0BSD OR ISC')
groups=('android-zix')
depends=('android-ndk')
makedepends=('android-meson')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://download.drobilla.net/zix-${pkgver}.tar.xz"{,.sig})
md5sums=('a21f979f98d9185f5e72ba91df4a776a'
         'SKIP')
validpgpkeys=('907D226E7E13FA337F014A083672782A9BF368F3') # David Robillard <d@drobilla.net>

build() {
    cd "${srcdir}/zix-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-meson build \
        --default-library both \
        -D benchmarks=disabled  \
        -D docs=disabled \
        -D html=disabled  \
        -D lint=false \
        -D singlehtml=disabled \
        -D tests=disabled \
        -D tests_cpp=disabled
    ninja -C build
}

package() {
    cd "${srcdir}/zix-${pkgver}"
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" ninja -C build install
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_RANLIB} "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true
}
