# Maintainer: Kartik Mohta <kartikmohta@gmail.com>
pkgname=gtsam
pkgver=3.2.2
pkgrel=1
pkgdesc="A library of C++ classes that implement smoothing and mapping (SAM) in\
  robotics and vision, using factor graphs and Bayes networks as the underlying\
  computing paradigm rather than sparse matrices."
url="http://borg.cc.gatech.edu/download.html"
arch=('x86_64' 'i686')
license=('BSD')
depends=('boost-libs' 'intel-tbb')
makedepends=('boost')
source=("https://bitbucket.org/gtborg/gtsam/get/${pkgver}.tar.bz2"
        "boost-optional-allow-binding-to-rvalues.patch"
        "boost-optional-ref-assignment.patch")
md5sums=('1ac5acd1d94a3616363b1e606a5946ef'
         'f83f7fa712e9b19dea91030d8dcfdfcb'
         'e917245397b3035abc2de9a967800e89')
_dir="gtborg-gtsam-03f518eadb35"

prepare() {
  cd "${srcdir}/${_dir}"
  patch -p1 -i ../boost-optional-allow-binding-to-rvalues.patch
  patch -p1 -i ../boost-optional-ref-assignment.patch
}

build() {
  cd "${srcdir}/${_dir}"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DGTSAM_BUILD_EXAMPLES_ALWAYS=OFF \
    -DGTSAM_BUILD_TESTS=OFF \
    -DGTSAM_BUILD_WRAP=OFF \
    -DGTSAM_BUILD_DOCS=OFF \
    -DGTSAM_INSTALL_CPPUNITLITE=OFF \
    -DGTSAM_INSTALL_GEOGRAPHICLIB=OFF \
    ..
  make
}

package() {
  cd "${srcdir}/${_dir}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/${_dir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
