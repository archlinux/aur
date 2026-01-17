# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=aarch64

pkgname=android-${_android_arch}-libudfread
pkgver=1.2.0
pkgrel=1
arch=('any')
pkgdesc="UDF reader. (Android ${_android_arch})"
url='https://code.videolan.org/videolan/libudfread'
license=('LGPL2.1')
groups=('android-libudfread')
depends=("android-ndk")
makedepends=('android-meson'
             'ninja')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://code.videolan.org/videolan/libudfread/-/archive/${pkgver}/libudfread-${pkgver}.tar.bz2")
md5sums=('a0636a576209d47ada44960c922cfa5d')

build() {
    cd "${srcdir}/libudfread-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-meson build
    ninja -C build all
}

package() {
    cd "${srcdir}/libudfread-${pkgver}"
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" ninja -C build install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true

    install -vDm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
