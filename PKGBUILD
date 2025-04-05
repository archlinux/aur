# Maintainer:  Michael (https://aur.archlinux.org/account/michael_wzq)
# Maintainer: Sebastian Ehlert  <awvwgk at gmail dot com>
# shellcheck disable=SC2034,SC2154

_pkgname=xtb
pkgname="${_pkgname}-git"
pkgver=6.7.1.r516.04ad2f8
pkgrel=1
arch=('x86_64')
url="https://github.com/grimme-lab/xtb"
provides=("${_pkgname}")
depends=(
  'bash'
  'gcc-libs'
  'glibc'
  'lapack'
  'openblas'
  'tcsh'
)
makedepends=('git' 'meson' 'ninja' 'inetutils' 'gcc-fortran')
conflicts=("${_pkgname}")
license=('LGPL-3.0-only' 'GPL-3.0-only')
pkgdesc="Semiempirical Extended Tight-Binding Program Package"
source=("git+https://github.com/grimme-lab/xtb.git#branch=main")
b2sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}" || exit 1
  _parent_ver=$(git describe --tags --match 'v*' --abbrev=0 | sed 's/\([^-]*-\)g/r\1/;s/-//g' | tr -d '[:alpha:]' )
  printf "%s.r%s.%s" \
         "${_parent_ver}" \
         "$(git rev-list --count HEAD)" \
         "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "${srcdir}/${_pkgname}"/_build
  cd "${srcdir}/${_pkgname}"/_build || exit 1
  meson setup . .. \
      --buildtype release \
      --warnlevel 0 \
      --prefix=/usr \
      -Dlapack=openblas
  ninja
}

package() {
  cd "${srcdir}/${_pkgname}"/_build || exit 1
  DESTDIR="$pkgdir" ninja install
}
