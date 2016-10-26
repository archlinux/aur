# Maintainer: Kartik Mohta <kartikmohta@gmail.com>
pkgname=gtsam-git
pkgver=r9823.de854da
pkgrel=1
pkgdesc="A library of C++ classes that implement smoothing and mapping (SAM) in robotics and vision, using factor graphs and Bayes networks as the underlying computing paradigm rather than sparse matrices."
url="https://collab.cc.gatech.edu/borg/gtsam/"
arch=('x86_64' 'i686')
license=('BSD')
depends=('boost-libs' 'intel-tbb')
makedepends=('boost')
provides=('gtsam')
conflicts=('gtsam')
source=($pkgname::git+https://bitbucket.org/gtborg/gtsam.git)
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  mkdir -p build
  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DGTSAM_BUILD_EXAMPLES_ALWAYS=OFF \
    -DGTSAM_BUILD_TESTS=OFF \
    -DGTSAM_BUILD_WRAP=OFF \
    -DGTSAM_BUILD_DOCS=ON \
    -DGTSAM_ALLOW_DEPRECATED_SINCE_V4=OFF \
    -DGTSAM_USE_SYSTEM_EIGEN=ON \
    -DGTSAM_SUPPORT_NESTED_DISSECTION=OFF
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
