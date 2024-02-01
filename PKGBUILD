# Maintainer: Gerasimos Chourdakis <chourdak at in dot tum dot de>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Florian Lindner <florian.lindner@xgm.de>
_base=precice
pkgname=${_base}-git
pkgver=3.0.0.r2.g9dffe0414
pkgrel=1
pkgdesc="A Coupling Library for Partitioned Multi-Physics Simulations on Massively Parallel Systems (git version)"
arch=(x86_64)
url="https://${_base}.org"
license=(LGPL3)
depends=(boost eigen jsoncpp libxml2 petsc)
makedepends=(cmake doxygen gcc-fortran graphviz texlive-basic git)
# checkdepends=(python-polars)
optdepends=('man-db: manual pages for precice-tools'
  'git: for Git Revision Info support')
source=(git+https://github.com/${_base}/${_base}.git#branch=develop)
sha512sums=('SKIP')
provides=(${_base})
conflicts=(${_base} petsc-complex)

pkgver() {
  cd ${_base}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake \
    -S ${_base} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_CXX_STANDARD_REQUIRED=Yes \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_TESTING=ON \
    -DPRECICE_FEATURE_MPI_COMMUNICATION=ON \
    -DPRECICE_FEATURE_PETSC_MAPPING=ON \
    -DPRECICE_FEATURE_PYTHON_ACTIONS=ON \
    -DPRECICE_CONFIGURE_PACKAGE_GENERATION=ON \
    -DPRECICE_FEATURE_GINKGO_MAPPING=OFF \
    -DPRECICE_BINDINGS_C=ON \
    -DPRECICE_BINDINGS_FORTRAN=ON \
    -DPRECICE_BUILD_TOOLS=ON \
    -DPRECICE_FEATURE_LIBBACKTRACE_STACKTRACES=ON \
    -DCMAKE_CXX_EXTENSIONS=No \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
    -Wno-dev

  cmake --build build --target all
}

check() {
  if [ -z "$(ldconfig -p | grep libcuda.so.1)" ]; then
    export OMPI_MCA_opal_warn_on_missing_libcuda=0
  fi

  ctest --test-dir build
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install doxygen
  install -Dm 644 ${_base}/LICENSE -t ${pkgdir}/usr/share/licenses/${_base}
  install -Dm 644 ${_base}/docs/man/man1/${_base}-tools.1 -t ${pkgdir}/usr/share/man/man1/
  mv ${pkgdir}/usr/share/doc/lib${_base}3 ${pkgdir}/usr/share/doc/${_base}
  mv ${_base}/docs/source-code-documentation/html/* ${pkgdir}/usr/share/doc/${_base}
  cd "${pkgdir}"
  rm -r usr/share/lintian
}
