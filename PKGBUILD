# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>

_pkgname=avogadrolibs
pkgname="${_pkgname}-git"
pkgver=0.8.0.r969.2d2f8d3
pkgrel=1
pkgdesc="Avogadro 2: libraries"
url="http://openchemistry.org/projects/avogadro2"
arch=("i686" "x86_64")
license=("Kitware")
depends=("libgl" "glew" "qt5-base" "vtk" "hdf5" "molequeue")
makedepends=("git" "cmake" "eigen3")
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git://github.com/OpenChemistry/${_pkgname}.git")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _parent_ver=$(git log --tags --simplify-by-decoration --pretty="format:%d" | head -n 1 | cut -d " " -f 6 | tr -d ",")
  printf "%s.r%s.%s" \
         "${_parent_ver}" \
         "$(git rev-list --count HEAD)" \
         "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  cmake \
      -DCMAKE_BUILD_TYPE:STRING=Release \
      -DCMAKE_INSTALL_PREFIX:PATH=/usr \
      -DCMAKE_INSTALL_LIBDIR:PATH=lib \
      -DENABLE_TESTING:BOOL=OFF \
      -DBUILD_SHARED_LIBS:BOOL=ON \
      .
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
  install -D -m 644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
