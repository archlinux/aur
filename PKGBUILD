# Maintainer: Sebastian Ehlert  <awvwgk at gmail dot com>

pkgname=dftd4-git
pkgver=3.3.0.r162.3d8ef7a
pkgrel=1
arch=('x86_64')
url="https://github.com/dftd4/dftd4"
provides=('dftd4')
depends=('gcc-fortran'
         'openblas'
         'lapack')
makedepends=('meson'
             'ninja'
             'git')
conflicts=('dftd4')
license=('LGPL3')
pkgdesc="A Generally Applicable Atomic-Charge Dependent London Dispersion Correction"
source=("${pkgname}::git+https://github.com/dftd4/dftd4.git#branch=main")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  _parent_ver=$(git describe --tags --abbrev=0 --match 'v*' | sed 's/\([^-]*-\)g/r\1/;s/-//g' | tr -d '[:alpha:]' )
  printf "%s.r%s.%s" \
         "${_parent_ver}" \
         "$(git rev-list --count HEAD)" \
         "$(git rev-parse --short HEAD)"
}

build() {
  meson setup _build_${CARCH} "${pkgname}" \
      --buildtype=release \
      --prefix=/usr \
      -Dlapack=openblas
  meson compile -C _build_${CARCH}
}

check() {
  meson test -C _build_${CARCH} --num-processes=1
}

package() {
  DESTDIR="$pkgdir" \
  meson install -C _build_${CARCH}
}
