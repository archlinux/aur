# Maintainer: Gerasimos Chourdakis <chourdak at in dot tum dot de>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Florian Lindner <florian.lindner@xgm.de>
_base=precice
pkgname=${_base}-git
pkgver=3.1.2.r97.g30671d34
pkgrel=1
pkgdesc="A Coupling Library for Partitioned Multi-Physics Simulations on Massively Parallel Systems (git version)"
arch=(x86_64)
url="https://${_base}.org"
license=(LGPL-3.0-or-later)
depends=(boost eigen jsoncpp libxml2 libbacktrace petsc)
makedepends=(cmake doxygen gcc-fortran graphviz git) # ginkgo-hpc
checkdepends=(python-polars)
optdepends=('man-db: manual pages for precice-tools'
  'git: for Git Revision Info support'
  'python-polars: for precice-profiling support'
  'python-simplejson: for precice-profiling support'
  'python-matplotlib: for precice-profiling support'
  'python-ujson: for precice-profiling support')
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
    -DPRECICE_CONFIGURE_PACKAGE_GENERATION=ON \
    -DPRECICE_BINDINGS_C=ON \
    -DPRECICE_BINDINGS_FORTRAN=ON \
    -DPRECICE_BUILD_TOOLS=ON \
    -DPRECICE_FEATURE_GINKGO_MAPPING=OFF \
    -DPRECICE_FEATURE_LIBBACKTRACE_STACKTRACES=ON \
    -DPRECICE_FEATURE_MPI_COMMUNICATION=ON \
    -DPRECICE_FEATURE_PETSC_MAPPING=ON \
    -DPRECICE_FEATURE_PYTHON_ACTIONS=ON \
    -DCMAKE_CXX_EXTENSIONS=No \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
    -Wno-dev

  cmake --build build --target all
}

check() {
  ctest -E "(${_base}.integration.GeometricMultiscale|${_base}.integration.Parallel|${_base}.integration.QuasiNewton|${_base}.integration.Serial)" --test-dir build
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
