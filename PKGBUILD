# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Markus Hovorka <m.hovorka@live.de>
_base=netgen
pkgname=${_base}-nogui
pkgver=6.2.2404
pkgrel=1
pkgdesc="Netgen mesh generator"
arch=(i686 x86_64)
url="https://github.com/NGSolve/${_base}"
license=(LGPL-2.1-only)
depends=(metis opencascade openmpi) # python
makedepends=(cmake git) # python-pybind11-stubgen
# checkdepends=(python-pytest python-mpi4py)
source=(${_base}-${pkgver}::git+${url}.git#tag=v${pkgver}
  github.com-pybind11::git+https://github.com/NGSolve/pybind11.git)
sha512sums=('7447e70731b2f98838a4d8ad65e1be192b660d9d9fde3a4474a0c7c37448342ce5b10d9b1ee20698b90996f0aab966ad7fb89b7a39f21b564bab4a9bcacd3c40'
  'SKIP')

prepare() {
  cd ${_base}-${pkgver}
  git submodule init
  git config submodule.external_dependencies/pybind11.url "${srcdir}/github.com-pybind11"
  git -c protocol.file.allow=always submodule update
}

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
    -DBUILD_STUB_FILES=ON \
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
    -DUSE_MPI_WRAPPER=OFF \
    -DUSE_NATIVE_ARCH=OFF \
    -DUSE_NUMA=OFF \
    -DUSE_OCC=ON \
    -DUSE_PYTHON=OFF \
    -DUSE_STLGEOM=ON \
    -DUSE_SUPERBUILD=OFF \
    -DNG_INSTALL_DIR_PYTHON=${pkgdir} \
    -Wno-dev
  cmake --build build --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 ${_base}-${pkgver}/LICENSE -t "${pkgdir}/usr/share/licenses/${_base}"
  install -Dm644 ${_base}-${pkgver}/doc/ng4.pdf -t "${pkgdir}/usr/share/doc/${_base}"
  # install libsrc/ needed by some packages (e.g. FreeCAD)
  cp -R "libsrc/" "${pkgdir}/usr/share/${_base}"
}
