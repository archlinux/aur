# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=embree-bvh_build-git
pkgver=7289.1b82e5526
pkgrel=2
pkgdesc="Custom version of Embree exposing BVH builder for use with luxrays"
arch=('x86_64')
url="https://github.com/Dade916/embree/tree/bvh_build"
license=('Apache')
depends=('intel-tbb')
options=(!buildflags staticlibs)
makedepends=('cmake' 'ispc' 'freeglut' 'libxmu' 'openexr' 'git')
source=('git+https://github.com/Dade916/embree.git#branch=bvh_build'
        'non-colliding.patch')
md5sums=('SKIP'
         'a2f00f0557fa7f73ec48c6b153eae952')

pkgver() {
  cd "$srcdir/embree"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd ${srcdir}/embree
  mv include/embree2 include/embree2-bvh
  patch -Np1 -i ../non-colliding.patch
}

build() {
  cd "$srcdir/embree"
  mkdir -p build
  cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_TUTORIALS=OFF
  make
}

package() {
  cd "$srcdir/embree/build"
  make DESTDIR="$pkgdir" install
}

