# Maintainer: Kartik Mohta <kartikmohta@gmail.com>
pkgname=gtsam-git
pkgver=r11053.c6449a82d
pkgrel=2
pkgdesc="A library of C++ classes that implement smoothing and mapping (SAM) in robotics and vision, using factor graphs and Bayes networks as the underlying computing paradigm rather than sparse matrices."
url="https://gtsam.org/"
arch=('x86_64' 'i686')
license=('BSD')
depends=('boost-libs')
makedepends=('boost' 'cmake')
optdepends=('intel-tbb: Use Intel TBB to accelerate computations (add this to the depends section of the PKGBUILD and rebuild the package)'
            'intel-mkl: Use Intel MKL to accelerate computations (add this to the depends section of the PKGBUILD and rebuild the package)')
provides=('gtsam')
conflicts=('gtsam')
source=("$pkgname::git+https://github.com/borglab/gtsam.git"
        "rename-included-libmetis.patch")
md5sums=('SKIP'
         '63093f474f5574e8dd3e300289dab47f')


pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -p1 -i ../rename-included-libmetis.patch
}

build() {
  cd "${srcdir}/${pkgname}"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DGTSAM_BUILD_EXAMPLES_ALWAYS=OFF \
    -DGTSAM_BUILD_TESTS=ON \
    -DGTSAM_BUILD_WRAP=OFF \
    -DGTSAM_BUILD_DOCS=ON \
    -DGTSAM_INSTALL_CPPUNITLITE=OFF \
    -DGTSAM_INSTALL_GEOGRAPHICLIB=OFF \
    -DGTSAM_USE_SYSTEM_EIGEN=ON \
    ..
  make && make doc
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -d "$pkgdir/usr/share/doc/$pkgname/"
  cp -a "${srcdir}/${pkgname}/doc/html" "$pkgdir/usr/share/doc/$pkgname/"
}

# vim:set ts=2 sw=2 et:
