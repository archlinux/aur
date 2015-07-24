# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>

_pkgname=avogadro2
pkgname="${_pkgname}-git"
_gitname=avogadroapp
pkgver=0.8.0.r969.2d2f8d3
pkgrel=1
pkgdesc="Avogadro 2: graphical application"
url="http://openchemistry.org/projects/avogadro2"
arch=("i686" "x86_64")
license=("Kitware")
depends=("libgl" "glew" "qt5-base" "vtk" "hdf5" "avogadrolibs")
makedepends=("git" "cmake" "eigen3")
install=avogadro2.install
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git://github.com/OpenChemistry/${_gitname}.git")
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
  cd "${srcdir}/${_gitname}"
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
  cd "${srcdir}/${_gitname}"
  make DESTDIR="${pkgdir}" install
  install -D -m 644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
