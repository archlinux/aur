# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Bruno Pagani <archange@archlinux.org>

_android_arch=x86

pkgname=android-${_android_arch}-libaec
pkgver=1.1.4
pkgrel=1
pkgdesc="Adaptive Entropy Coding library (Android ${_android_arch})"
arch=('any')
url="https://gitlab.dkrz.de/k202009/libaec"
license=('custom')
groups=('android-libaec')
depends=('android-ndk')
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("${url}/-/archive/v${pkgver}/libaec-v${pkgver}.tar.bz2")
md5sums=('f4da1452e4060850ee3a1b50d2a4829c')

build() {
    cd "${srcdir}/libaec-v${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build
    make -C build $MAKEFLAGS
}

package() {
    cd "${srcdir}/libaec-v${pkgver}"
    source android-env ${_android_arch}

    make -C build DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
    install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
