# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Lucas H. Gabrielli <heitzmann@gmail.com>
_base=mshr
pkgname=${_base}-git
pkgdesc="Mesh generation component of FEniCS (git version)"
pkgver=20200924
pkgrel=1
arch=('x86_64')
url="https://bitbucket.org/fenics-project/${_base}"
license=(GPL3)
depends=(dolfin mpfr tetgen) # cgal
makedepends=(cmake git)
provides=("${_base}=${pkgver}")
conflicts=("${_base}")
# options=(!emptydirs)
source=(git+${url}.git#branch=master)
sha512sums=('SKIP')

pkgver() {
  cd ${_base}
  git log --format="%cd" --date=short -1 | sed 's/-//g'
}
# -DCMAKE_SKIP_BUILD_RPATH:BOOL=ON \
# -DUSE_SYSTEM_CGAL:BOOL=ON \
build() {
  cmake \
    -S ${_base} \
    -B build \
    -DCMAKE_BUILD_TYPE:STRING=None \
    -DCMAKE_INSTALL_PREFIX="${pkg}"/usr \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DCMAKE_SKIP_RPATH:BOOL=ON \
    -DCMAKE_INSTALL_RPATH_USE_LINK_PATH:BOOL=OFF \
    -DUSE_SYSTEM_TETGEN:BOOL=ON \
    -DENABLE_TESTS:BOOL=ON \
    -DENABLE_MSHRABLE:BOOL=ON \
    -Wno-dev
  cmake --build build --target all
}

check() {
  if [ -z $(ldconfig -p | grep libcuda.so.1) ]; then
    export OMPI_MCA_opal_warn_on_missing_libcuda=0
  fi
  LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${srcdir}/build" ctest -E "^Python-*" --test-dir build
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 ${_base}/COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
