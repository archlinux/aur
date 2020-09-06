# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>

_pkgname=avogadrolibs
pkgname="${_pkgname}-git"
pkgver=1.93.0.r1889.e169315d
pkgrel=1
pkgdesc="Avogadro 2: libraries"
url="http://openchemistry.org/projects/avogadro2"
arch=("x86_64")
license=("Kitware")
depends=("libarchive" "glew" "hdf5" "vtk" "libmsym" "spglib" "libmmtf" "qt5-webview" "qt5-x11extras" "molequeue" "pybind11" "python-cclib")
# gdal is for proj, which is optional for VTK but required here? same for openmpi
# `msgpack-c` is a workaround for the broken libmmtf PKGBUILD
makedepends=("git" "cmake" "eigen" "gtest" "gdal" "openmpi" "msgpack-c")
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git://github.com/OpenChemistry/${_pkgname}.git"
        "hdf5_110.patch")
sha256sums=("SKIP"
            "9af8f4b74367debe1ebe4e6bac4434d901958fdcf2375462e9c932d826603266")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "%s.r%s.%s" \
         "$(git describe --tags --abbrev=0)" \
         "$(git rev-list --count HEAD)" \
         "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  patch -p1 -i "${srcdir}"/hdf5_110.patch

  mkdir -p "${srcdir}"/build
}

build() {
  cd "${srcdir}"/build
  cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DBUILD_SHARED_LIBS=ON \
      -DENABLE_TESTING=ON \
      -DUSE_HDF5=ON \
      -DUSE_VTK=ON \
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
