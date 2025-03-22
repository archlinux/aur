# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Bruno Pagani <archange@archlinux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libyuv
pkgver=r2426+464c51a03
pkgrel=1
arch=('any')
pkgdesc="Library for YUV scaling (Android ${_android_arch})"
url="https://chromium.googlesource.com/libyuv/libyuv/"
license=('custom')
groups=('android-libyuv')
depends=("android-${_android_arch}-libjpeg")
makedepends=('android-cmake'
             'git')
options=(!strip !buildflags staticlibs !emptydirs)
# Version required by libavif
_commit=464c51a0353c71f08fe45f683d6a97a638d47833
source=("git+${url}#commit=${_commit}")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/libyuv"
    printf "r%s+%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/libyuv"
    sed -i 's|yuvconvert ${JPEG_LIBRARY}|${ly_lib_shared} ${JPEG_LIBRARY}|' CMakeLists.txt
}

build() {
    cd "${srcdir}/libyuv"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build
    make -C build
}

package() {
    cd "${srcdir}/libyuv"
    source android-env ${_android_arch}

    make -C build DESTDIR="${pkgdir}" install
    rm -rf "$pkgdir/${ANDROID_PREFIX_BIN}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
