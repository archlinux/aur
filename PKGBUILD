# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>

_pkgname=avogadrolibs
pkgname="${_pkgname}-git"
pkgver=1.90.0.r1421.7e5b184
pkgrel=6
pkgdesc="Avogadro 2: libraries"
url="http://openchemistry.org/projects/avogadro2"
arch=("i686" "x86_64")
license=("Kitware")
depends=("libarchive" "eigen3" "glew" "hdf5" "vtk" "spglib" "qt5-webview" "molequeue" "python" "pybind11")
# gdal is for proj, which is optional for VTK but required here?
makedepends=("git" "cmake" "gtest" "gdal")
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
      -DUSE_OPENGL:BOOL=ON \
      -DUSE_HDF5:BOOL=ON \
      -DUSE_QT:BOOL=ON \
      -DUSE_VTK:BOOL=ON \
      -DUSE_LIBMSYM:BOOL=OFF \
      -DUSE_LIBSPG:BOOL=ON \
      -DUSE_PROTOCALL:BOOL=OFF \
      -DUSE_MOLEQUEUE:BOOL=ON \
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
  # Don't install bundled jsoncpp
  rm "${pkgdir}/usr/lib/libjsoncpp.a"
}
