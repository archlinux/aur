# $Id$
# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Maintainer: Bruno Pagani <archange@archlinux.org>

_pkgname=embree
pkgver=2.17.7
pkgname=${_pkgname}2
pkgrel=2
pkgdesc="A collection of high-performance ray tracing kernels. Version 2"
arch=('x86_64')
url="https://embree.github.io/"
license=('Apache')
depends=('intel-tbb')
makedepends=('cmake' 'ispc' 'freeglut' 'libxmu' 'openexr')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/embree/embree/archive/v${pkgver}.tar.gz")
sha256sums=('c0694f287fa1fbb382aba3a895702e248d92f7e89c0e5f64aefee965482ec04c')

build() {
    cd ${_pkgname}-${pkgver}
    cmake . \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DCMAKE_BUILD_TYPE=Release \
      -DEMBREE_TUTORIALS=OFF \
      -DEMBREE_MAX_ISA="AVX512SKX"
    # Embree detects actual ISA at runtime
    make
}

package() {
    cd ${_pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
    #prevent collision with official embree package
    rm ${pkgdir}/usr/lib/libembree.so
}

