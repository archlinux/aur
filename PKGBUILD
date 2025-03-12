# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Markus Hovorka <m.hovorka@live.de>
_base=netgen
pkgname=${_base}-nogui
pkgver=6.2.2501
pkgrel=1
pkgdesc="Netgen mesh generator"
arch=(i686 x86_64)
url="https://github.com/NGSolve/${_base}"
license=(LGPL-2.1-only)
depends=(metis opencascade openmpi python-mpi4py)
makedepends=(cmake pybind11) # git python-pybind11-stubgen
# checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('7a39b8bc17216a69239e1f3774793f65e8ac3b1837b0859a730bba8967a4791a76ea5041a94e7de1e1e42f8d12b8ab59dfa06eadcf048f3c99dce57b360faa45')

build() {
  cmake \
    -S ${_base}-${pkgver} \
    -B build \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_FOR_CONDA=OFF \
    -DBUILD_STUB_FILES=OFF \
    -DENABLE_UNIT_TESTS=OFF \
    -DINSTALL_PROFILES=ON \
    -DINTEL_MIC=OFF \
    -DPREFER_SYSTEM_PYBIND11=ON \
    -DTRACE_MEMORY=OFF \
    -DUSE_CCACHE=OFF \
    -DUSE_CGNS=OFF \
    -DUSE_GEOM2D=ON \
    -DUSE_GUI=OFF \
    -DUSE_INTERFACE=ON \
    -DUSE_INTERNAL_TCL=ON \
    -DUSE_JPEG=OFF \
    -DUSE_MPEG=OFF \
    -DUSE_MPI=ON \
    -DUSE_MPI4PY=ON \
    -DUSE_MPI_WRAPPER=OFF \
    -DUSE_NATIVE_ARCH=OFF \
    -DUSE_NUMA=OFF \
    -DUSE_OCC=ON \
    -DUSE_PYTHON=ON \
    -DUSE_STLGEOM=ON \
    -DUSE_SUPERBUILD=OFF \
    -DNG_INSTALL_DIR_PYTHON=${pkgdir} \
    -Wno-dev
  cmake --build build --target all
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="${srcdir}" DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 ${_base}-${pkgver}/LICENSE -t "${pkgdir}/usr/share/licenses/${_base}"
  install -Dm644 ${_base}-${pkgver}/doc/ng4.pdf -t "${pkgdir}/usr/share/doc/${_base}"
  install -d ${pkgdir}${site_packages}
  mv ${pkgdir}${pkgdir}/* "${pkgdir}${site_packages}"
  # install libsrc/ needed by some packages (e.g. FreeCAD)
  cp -R ${_base}-${pkgver}/libsrc/ "${pkgdir}/usr/share/${_base}"

  # remove reference to srcdir
  sed -i "s;${srcdir}/;;g" ${pkgdir}/usr/lib/cmake/netgen/NetgenConfig.cmake
}
