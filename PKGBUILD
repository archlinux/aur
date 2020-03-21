# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>

_pkgname=molequeue
pkgname="${_pkgname}-git"
pkgver=0.9.0.r817.0511c9a
pkgrel=1
pkgdesc="Desktop integration of high performance computing resources"
url="http://www.openchemistry.org/projects/molequeue"
arch=("x86_64")
license=("Kitware")
depends=("qt5-base")
makedepends=("git" "cmake")
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
      -DENABLE_TESTING:BOOL=ON \
      -DBUILD_SHARED_LIBS:BOOL=ON \
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
