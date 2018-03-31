# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>

_pkgname=avogadro2
pkgname="${_pkgname}-git"
_gitname=avogadroapp
pkgver=1.90.0.r373.d5e1f82
pkgrel=2
pkgdesc="Avogadro 2: graphical application"
url="http://openchemistry.org/projects/avogadro2"
arch=("i686" "x86_64")
license=("Kitware")
depends=("avogadrolibs-git")
makedepends=("git" "cmake" "eigen")
install=avogadro2.install
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${_pkgname}::git://github.com/OpenChemistry/${_gitname}.git")
sha256sums=('SKIP')

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
      -DUSE_VTK:BOOL=ON \
      .
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
