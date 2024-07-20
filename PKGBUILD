# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jan de Groot <jgc@archlinux.org>

_android_arch=aarch64

pkgname=android-${_android_arch}-libvdpau
pkgver=1.5
pkgrel=3
arch=('any')
pkgdesc="Nvidia VDPAU library (Android ${_android_arch})"
url='https://www.freedesktop.org/wiki/Software/VDPAU/'
license=('custom')
groups=(android-libvdpau)
depends=("android-${_android_arch}-libxext")
makedepends=('android-meson'
             "android-${_android_arch}-xorgproto")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://gitlab.freedesktop.org/vdpau/libvdpau/-/archive/${pkgver}/libvdpau-${pkgver}.tar.bz2")
md5sums=('148a192110e7a49d62c0bf9ef916c099')

build() {
    cd "${srcdir}/libvdpau-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-meson build \
        -Ddocumentation=false
    ninja -C build
}

package() {
    cd "${srcdir}/libvdpau-${pkgver}"
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" ninja -C build install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/vdpau/*.so
}
