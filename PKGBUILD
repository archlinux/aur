# Maintainer: Sebastian Ehlert  <awvwgk at gmail dot com>

_pkgname=xtb
pkgname="${_pkgname}-git"
pkgver=6.4.1.r286.92252bb
pkgrel=1
arch=('x86_64')
url="https://github.com/grimme-lab/xtb"
provides=("${_pkgname}")
depends=('openblas' 'lapack' 'gcc-libs')
makedepends=('git' 'meson' 'ninja' 'inetutils' 'gcc-fortran')
conflicts=("${_pkgname}")
license=('LGPL3')
pkgdesc="Semiempirical Extended Tight-Binding Program Package"
source=("git+https://github.com/grimme-lab/xtb.git#branch=main")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _parent_ver=$(git describe --tags --match 'v*' --abbrev=0 | sed 's/\([^-]*-\)g/r\1/;s/-//g' | tr -d '[:alpha:]' )
  printf "%s.r%s.%s" \
         "${_parent_ver}" \
         "$(git rev-list --count HEAD)" \
         "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "${srcdir}/${_pkgname}"/_build
  cd "${srcdir}/${_pkgname}"/_build
  meson setup . .. \
      --buildtype release \
      --warnlevel 0 \
      --prefix=/usr \
      -Dla_backend=openblas
  ninja
}

package() {
  cd "${srcdir}/${_pkgname}"/_build
  DESTDIR="$pkgdir" ninja install
}
