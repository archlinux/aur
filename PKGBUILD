pkgname=openmatrix
pkgver=1.0.12
pkgrel=1
pkgdesc="An open-source computational programming language"
license=('AGPL')
arch=('x86_64')
url="https://www.openmatrix.org/"
depends=(sundials fftw intel-oneapi-mkl qhull libantlr3c libmatio hdf5)
makedepends=(boost)
source=("https://github.com/OpenMatrixLanguage/OpenMatrix/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('faa6717455a09b95aff530de11f28a9eedb014d4ad9826f857570350c1a37ab6')

prepare() {
  cd OpenMatrix-${pkgver}
  sed -i "30i#include <climits>" src/oml/Runtime/BuiltInFuncs.cpp
  sed -i "44i#include <climits>" src/oml/Runtime/Evaluator.cpp
  curl -L https://github.com/OpenMatrixLanguage/OpenMatrix/pull/62.patch | patch -p1
}

build() {
  cd OpenMatrix-${pkgver}/src
  make -f makefile.open OML_ROOT="${srcdir}/OpenMatrix-${pkgver}" MKL_INCLUDE=/opt/intel/oneapi/mkl/2023.1.0/include MKL_LIBS="-L/opt/intel/oneapi/mkl/2023.1.0/lib/intel64/ -L/opt/intel/oneapi/compiler/2023.1.0/linux/compiler/lib/intel64_lin/ -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -liomp5" BOOST_DIR=/usr/include MATIO_INCLUDE=/usr/include QHULL_INC=/usr/include SUNDIALS_INCLUDE=/usr/include HDF5_LIBS="-lhdf5 -lhdf5_hl -lhdf5_cpp" FFTW_LIB="-lfftw3" QHULL_LIBS="-lqhull_r" ANTLR_DIR=/usr/include FFTW_INCLUDE=/usr/include
}

package() {
  cd OpenMatrix-${pkgver}
  install -d "${pkgdir}"/usr/{lib,bin}
  install -m755 src/bin/linux64/omlconsole $pkgdir/usr/bin
  install -m755 src/bin/linux64/*.so $pkgdir/usr/lib
}
