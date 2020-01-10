# Maintainer: Sebastian Ehlert  <awvwgk at gmail dot com>

pkgname=dftd4-git
pkgver=2.4.0.r82.0419702
pkgrel=1
arch=('x86_64')
url="https://github.com/dftd4/dftd4"
provides=('dftd4')
depends=('gcc-fortran' 'openblas' 'lapack')
makedepends=('git' 'meson' 'ninja')
conflicts=('dftd4')
license=('LGPL3')
pkgdesc="A Generally Applicable Atomic-Charge Dependent London Dispersion Correction"
source=("${pkgname}::git+https://github.com/dftd4/dftd4.git#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  _parent_ver=$(git describe --tags --abbrev=0 | sed 's/\([^-]*-\)g/r\1/;s/-//g' | tr -d '[:alpha:]' )
  printf "%s.r%s.%s" \
         "${_parent_ver}" \
         "$(git rev-list --count HEAD)" \
         "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "${pkgname}"/_build
  cd "${pkgname}"/_build
  meson setup . .. \
      --buildtype release \
      --warnlevel 0 \
      --prefix=/usr \
      -Dla_backend=openblas
  ninja
}

package() {
  cd "${pkgname}"/_build
  DESTDIR="$pkgdir" ninja install
}
