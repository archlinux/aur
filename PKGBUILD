# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Ronald van Haren <ronald@archlinux.org>
# Contributor: Chirantan Ekbote <chirantan.ekbote at gmail.com>
# Contributor: Kringel

_android_arch=x86-64

pkgname=android-${_android_arch}-eigen
pkgver=5.0.1
pkgrel=1
arch=('any')
pkgdesc="Lightweight C++ template library for vector and matrix math, a.k.a. linear algebra (Android ${_android_arch})"
url='https://eigen.tuxfamily.org'
license=('MPL-2.0'
         'Apache-2.0'
         'BSD-3-Clause'
         'Minpack'
         'LGPL-2.1-only OR LGPL-2.1-or-later')
depends=('android-ndk')
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://gitlab.com/libeigen/eigen/-/archive/${pkgver}/eigen-${pkgver}.tar.gz")
md5sums=('294f188b9cd8ff95650ebce53b8d3f1d')

build() {
    cd "${srcdir}/eigen-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build \
        -DBUILD_TESTING=OFF \
        -DEIGEN_BUILD_TESTING=OFF \
        -DEIGEN_BUILD_DOC=OFF \
        -DEIGEN_BUILD_DEMOS=OFF \
        -DEIGEN_BUILD_BLAS=OFF \
        -DEIGEN_BUILD_LAPACK=OFF
    make -C build $MAKEFLAGS
}

package() {
    cd "${srcdir}/eigen-${pkgver}"
    source android-env ${_android_arch}

    make -C build DESTDIR="${pkgdir}" install
    install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
