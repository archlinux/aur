# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>

_pkgname=molequeue
pkgname="${_pkgname}-git"
pkgver=0.8.0.r784.fdcdbfb
pkgrel=2
pkgdesc="Desktop integration of high performance computing resources"
url="http://www.openchemistry.org/projects/molequeue"
arch=("i686" "x86_64")
license=("Kitware")
depends=("qt5-base")
makedepends=("git" "cmake")
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git://github.com/OpenChemistry/${_pkgname}.git"
        "cmake_generateexportheader.patch")
sha256sums=("SKIP"
           "642d023be9456f71dd974693454a7817206548f4dcf086bd8e84eb1b1a1d0ea5")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _parent_ver=$(git log --tags --simplify-by-decoration --pretty="format:%d" | head -n 1 | cut -d " " -f 3 | tr -d ")" | tr -d v)
  printf "%s.r%s.%s" \
         "${_parent_ver}" \
         "$(git rev-list --count HEAD)" \
         "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  patch -p1 < "${srcdir}"/cmake_generateexportheader.patch
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
