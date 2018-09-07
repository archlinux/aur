# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>

_pkgname=avogadrolibs
pkgname="${_pkgname}-git"
pkgver=1.91.0.r1674.207b959f
pkgrel=1
pkgdesc="Avogadro 2: libraries"
url="http://openchemistry.org/projects/avogadro2"
arch=("x86_64")
license=("Kitware")
depends=("libarchive" "glew" "hdf5" "vtk" "libmsym-git" "spglib" "qt5-webview" "qt5-x11extras" "molequeue" "python" "pybind11")
# gdal is for proj, which is optional for VTK but required here? same for openmpi
makedepends=("git" "cmake" "eigen" "gtest" "gdal" "openmpi")
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git://github.com/OpenChemistry/${_pkgname}.git")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "%s.r%s.%s" \
         "$(git describe --tags --abbrev=0)" \
         "$(git rev-list --count HEAD)" \
         "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  cmake \
      -DCMAKE_BUILD_TYPE:STRING=Release \
      -DCMAKE_INSTALL_PREFIX:PATH=/usr \
      -DCMAKE_INSTALL_LIBDIR:PATH=lib \
      -DBUILD_SHARED_LIBS:BOOL=ON \
      -DENABLE_TESTING:BOOL=ON \
      -DUSE_HDF5:BOOL=ON \
      -DUSE_VTK:BOOL=ON \
      -DUSE_MMTF:BOOK=OFF \
      -DUSE_PYTHON:BOOL=ON \
      -DPYTHON_EXECUTABLE:PATH=/usr/bin/python \
      .
  make
}

check() {
  cd "${srcdir}/${_pkgname}"
  make test
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
