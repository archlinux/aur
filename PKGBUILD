# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>

_pkgname="libmsym"
pkgname="${_pkgname}-git"
pkgver=0.2.3.r190.c994703
pkgrel=1
pkgdesc="A library for handling molecular point group symmetry, with a Python interface (git version)"
arch=("x86_64")
url="https://github.com/mcodev31/libmsym"
license=("MIT")
makedepends=("git" "cmake")
depends=("python" "python-numpy")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/mcodev31/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _parent_ver=$(git describe --tags --abbrev=0 | sed 's/\([^-]*-\)g/r\1/;s/-//g' | tr -d '[:alpha:]' )
  printf "%s.r%s.%s" \
         "${_parent_ver}" \
         "$(git rev-list --count HEAD)" \
         "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "${srcdir}/${_pkgname}"/build
  cd "${srcdir}/${_pkgname}"/build

  cmake \
      -DCMAKE_BUILD_TYPE:STRING=Release \
      -DCMAKE_INSTALL_PREFIX:PATH=/usr \
      -DBUILD_SHARED_LIBS:BOOL=ON \
      -DMSYM_BUILD_EXAMPLES:BOOL=OFF \
      -DMSYM_BUILD_PYTHON:BOOL=ON \
      -DMSYM_PYTHON_INSTALL_OPTS:STRING="--root=${pkgdir}" \
      ..

  make
}

package() {
  cd "${srcdir}/${_pkgname}"/build
    make DESTDIR="${pkgdir}" install

  cd bindings/python
  make install
}
