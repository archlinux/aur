# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>

_pkgname=avogadro2
pkgname="${_pkgname}-git"
_gitname=avogadroapp
pkgver=1.93.0.r428.59c4dbd
pkgrel=1
pkgdesc="Avogadro 2: graphical application"
url="http://openchemistry.org/projects/avogadro2"
arch=("x86_64")
license=("Kitware")
depends=("avogadrolibs-git" "desktop-file-utils")
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

prepare() {
  mkdir -p "${srcdir}"/build
}

build() {
  cd "${srcdir}"/build
  cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DBUILD_SHARED_LIBS=ON \
      -DENABLE_TESTING=OFF \
      -DUSE_VTK=ON \
      "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "${srcdir}"/build
  make DESTDIR="${pkgdir}" install
  install -D -m 644 "${srcdir}/${_pkgname}"/LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
