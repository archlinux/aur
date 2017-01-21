# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>

_pkgname=avogadrolibs
pkgname="${_pkgname}-git"
pkgver=1.90.0.r1254.1f3c3bf
pkgrel=5
pkgdesc="Avogadro 2: libraries"
url="http://openchemistry.org/projects/avogadro2"
arch=("i686" "x86_64")
license=("Kitware")
depends=("molequeue" "glew" "hdf5" "python" "boost" "spglib" "qt5-webview")
makedepends=("git" "cmake" "eigen3")
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git://github.com/OpenChemistry/${_pkgname}.git")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _parent_ver=$(git log --tags --simplify-by-decoration --pretty="format:%d" | head -n 1 | cut -d " " -f 3 | tr -d ")")
  printf "%s.r%s.%s" \
         "${_parent_ver}" \
         "$(git rev-list --count HEAD)" \
         "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  # Find spglib
  sed -i 's|NAMES spglib)|NAMES spglib symspg)|' cmake/FindSpglib.cmake
}

build() {
  cd "${srcdir}/${_pkgname}"
  cmake \
      -DCMAKE_BUILD_TYPE:STRING=Release \
      -DCMAKE_INSTALL_PREFIX:PATH=/usr \
      -DCMAKE_INSTALL_LIBDIR:PATH=lib \
      -DENABLE_TESTING:BOOL=OFF \
      -DBUILD_SHARED_LIBS:BOOL=ON \
      -DUSE_HDF5:BOOL=ON \
      -DUSE_VTK:BOOL=OFF \
      -DPYTHON_EXECUTABLE:PATH=/usr/bin/python \
      -DUSE_BOOST_PYTHON:BOOL=ON \
      .
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
  install -D -m 644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  # Don't install bundled jsoncpp
  rm "${pkgdir}/usr/lib/libjsoncpp.a"
}
