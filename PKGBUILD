# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Mihai Bişog <mihai.bisog@gmail.com>

_android_arch=riscv64

pkgname=android-${_android_arch}-fmt
pkgver=11.2.0
pkgrel=1
arch=('any')
pkgdesc="Open-source formatting library for C++ (Android ${_android_arch})"
url='https://fmt.dev'
license=('MIT')
groups=('android-fmt')
depends=('android-ndk')
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/fmtlib/fmt/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('2f3701cada629ca455c3388d1089f5bd')

build() {
    cd "${srcdir}/fmt-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build-shared \
        -DBUILD_SHARED_LIBS=ON \
        -DFMT_DOC=OFF \
        -DFMT_TEST=OFF
    make -C build-shared $MAKEFLAGS

    android-${_android_arch}-cmake \
        -S . \
        -B build-static \
        -DBUILD_SHARED_LIBS=OFF \
        -DFMT_DOC=OFF \
        -DFMT_TEST=OFF
    make -C build-static $MAKEFLAGS
}

package() {
    cd "${srcdir}/fmt-${pkgver}"
    source android-env ${_android_arch}

    make -C build-shared DESTDIR="${pkgdir}" install
    make -C build-static DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
