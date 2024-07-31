# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: Robert Rakhmatulin <drakonu@otso.city>
pkgver=r17196.3c9936cb6
pkgname=embree-git
pkgrel=1
pkgdesc="A collection of high-performance ray tracing kernels."
arch=('x86_64')
url="https://embree.github.io/"
license=('Apache')
provides=(embree)
conflicts=(embree)
depends=('intel-tbb')
makedepends=('cmake' 'ispc' 'freeglut' 'libxmu' 'openexr')
source=("embree::git+https://github.com/RenderKit/embree.git")
sha256sums=('SKIP')
pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    cd ${pkgname}
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
    cd ${pkgname}
    make DESTDIR="${pkgdir}" install
}

