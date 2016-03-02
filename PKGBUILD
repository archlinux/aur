pkgname=muq
pkgver=0.2
pkgrel=1
pkgdesc="MIT Uncertainty Quantification Library"
license=('MIT')
arch=('i686' 'x86_64')
url="http://muq.mit.edu/"
depends=('boost-libs' 'nlopt' 'python2' 'sundials' 'flann' 'nlopt')
makedepends=('cmake' 'eigen')
source=("https://bitbucket.org/mituq/muq/downloads/MUQ-v${pkgver}.tar.gz")
sha1sums=('f164c996ce3232da526d6f9f30b8348f38a113cd')

prepare() {
  cd MUQ
  # https://bitbucket.org/mituq/muq/pull-requests/30
  sed -i "/shared_ptr_helper/d" cmake/checks/CheckBoost.cmake

  # https://bitbucket.org/mituq/muq/pull-requests/31
  sed -i "s|\.\${CMAKE_SHARED_LIBRARY_PREFIX}|\${CMAKE_SHARED_LIBRARY_SUFFIX}|g" cmake/finds/FindSUNDIALS.cmake
  sed -i "s|Ssundials_nvecserial|sundials_nvecserial|g" cmake/finds/FindSUNDIALS.cmake

  # removed in master ?
  sed -i "s|tridiagonal_qr_step<Eigen::ColMajor>|tridiagonal_qr_step|g" MUQ/Utilities/LanczosEigenSolver.h

  sed -i "s|\${CMAKE_INSTALL_PREFIX}/CMake|lib/cmake|g" CMakeLists.txt

  sed -i "s|execute_process(COMMAND python|execute_process(COMMAND python2|g" CMakeLists.txt
}

build() {
  cd MUQ
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_SKIP_INSTALL_RPATH=ON \
        -DInference_build=OFF \
        -DMUQ_USE_PYTHON=ON -DMUQ_PYTHON_VERSION=2.7 \
        -DMUQ_USE_NLOPT=ON \
        .
  make
}

package() {
  cd MUQ
  make DESTDIR="$pkgdir" install
  install -d "$pkgdir"/usr/share/licenses/${pkgname}
  install -m644 license.txt "$pkgdir"/usr/share/licenses/${pkgname}
}
