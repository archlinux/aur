# $Id$
# Maintainer: Robert Rakhmatulin <drakonu@otso.city>

_pkgname=embree-git
pkgver=4.3.2
pkgname=${_pkgname}
pkgrel=400300200
pkgdesc="A collection of high-performance ray tracing kernels."
arch=('x86_64')
url="https://embree.github.io/"
license=('Apache')
depends=('intel-tbb')
makedepends=('cmake' 'ispc' 'freeglut' 'libxmu' 'openexr')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/RenderKit/embree/archive/v${pkgver}.tar.gz")
sha256sums=('dc7bb6bac095b2e7bc64321435acd07c6137d6d60e4b79ec07bb0b215ddf81cb')

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

