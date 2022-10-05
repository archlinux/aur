# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>

_pkgname=avogadrolibs
pkgname="${_pkgname}-git"
pkgver=1.97.0.r3051.19594871
pkgrel=1
pkgdesc="Avogadro 2: libraries"
url="http://openchemistry.org/projects/avogadro2"
arch=("x86_64")
license=("Kitware")
depends=("libarchive" "glew" "hdf5" "libmsym" "spglib" "mmtf-cpp" "qt5-webview" "qt5-x11extras" "molequeue" "pybind11" "python-cclib")
makedepends=("git" "cmake" "eigen")
checkdepends=("gtest")
conflicts=("${_pkgname}" avogadro-crystals avogadro-molecules)
provides=("${_pkgname}" avogadro-crystals avogadro-molecules)
source=("git+https://github.com/OpenChemistry/${_pkgname}.git")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "%s.r%s.%s" \
         "$(git describe --tags --abbrev=0)" \
         "$(git rev-list --count HEAD)" \
         "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "${srcdir}"/build
  cd "${srcdir}"/build
  cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DBUILD_SHARED_LIBS=ON \
      -DENABLE_TESTING=ON \
      -DUSE_HDF5=ON \
      -DUSE_VTK=OFF \
      -DUSE_MMTF=ON \
      -DUSE_PYTHON=ON \
      -DPYTHON_EXECUTABLE=/usr/bin/python \
      "${srcdir}/${_pkgname}"
  make
}

check() {
  cd "${srcdir}"/build
  make test
}

package() {
  cd "${srcdir}"/build
  make DESTDIR="${pkgdir}" install
  install -D -m 644 "${srcdir}/${_pkgname}"/LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
