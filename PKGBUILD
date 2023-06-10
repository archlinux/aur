# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>

_pkgname=spglib
pkgname="${_pkgname}-git"
pkgver=2.1.0rc2.r1647.3800c46
pkgrel=1
pkgdesc="C library for finding and handling crystal symmetries"
url="https://spglib.readthedocs.io/en/latest/"
arch=("i686" "x86_64")
license=("BSD-3-Clause")
depends=("glibc")
makedepends=("git" "cmake" "gcc")
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git+https://github.com/spglib/${_pkgname}")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "%s.r%s.%s" \
         "$(git describe --tags --abbrev=0 | tr -d 'v-')" \
         "$(git rev-list --count HEAD)" \
         "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  mkdir -p build

  cmake -B build .

  cd build
  make
}

check() {
  cd "${srcdir}/${_pkgname}"

  ctest --test-dir build
}

package() {
  cd "${srcdir}/${_pkgname}/build"
  make DESTDIR="${pkgdir}" install
}
