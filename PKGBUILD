# Maintainer: Paul Irofti <paul@irofti.net>
pkgname=gtsam-git
pkgver=r18873.c9498fe0c
pkgrel=1
pkgdesc="A library of C++ classes that implement smoothing and mapping (SAM) in robotics and vision, using factor graphs and Bayes networks as the underlying computing paradigm rather than sparse matrices."
url="https://gtsam.org/"
arch=('x86_64' 'i686')
license=('BSD')
depends=('boost-libs' 'python-pybind11-stubgen')
makedepends=('boost' 'cmake')
optdepends=('intel-tbb: Use Intel TBB to accelerate computations (add this to the depends section of the PKGBUILD and rebuild the package)'
            'intel-mkl: Use Intel MKL to accelerate computations (add this to the depends section of the PKGBUILD and rebuild the package)')
provides=('gtsam')
conflicts=('gtsam')
source=("$pkgname::git+https://github.com/borglab/gtsam.git#branch=develop"
        "rename-included-libmetis.patch"
        "cmake-disable-werror.patch")
md5sums=('SKIP'
         'de5c5b2be397050f435884139b1425c0'
         '9591c2ea3867a367c8662bef1957795c')


pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -p1 -i ../rename-included-libmetis.patch
  patch -p1 -i ../cmake-disable-werror.patch
}

build() {
  cd "${srcdir}/${pkgname}"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DGTSAM_BUILD_UNSTABLE=OFF \
    -DGTSAM_BUILD_EXAMPLES_ALWAYS=OFF \
    -DGTSAM_BUILD_TESTS=ON \
    -DGTSAM_BUILD_WRAP=OFF \
    -DGTSAM_BUILD_DOCS=ON \
    -DGTSAM_INSTALL_CPPUNITLITE=OFF \
    -DGTSAM_INSTALL_GEOGRAPHICLIB=OFF \
    -DGTSAM_USE_SYSTEM_EIGEN=ON \
    -DGTSAM_BUILD_PYTHON=ON \
    ..
  make

  cd "${srcdir}/${pkgname}/build/python"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd "${srcdir}/${pkgname}/build/python"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
