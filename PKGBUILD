# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com

set -u
pkgname='lfanew-git'
pkgver=0.0.20230825.r12.gc1980df
pkgrel=2
pkgdesc='manipulate fat binary programs wrapped inside MS-DOS MZ files'
arch=('x86_64')
#url='https://github.com/stsp/lfanew'
url='https://codeberg.org/tkchia/lfanew'
license=('MPL-2.0')
depends=('glibc')
makedepends=('git')
#makedepends+=('p7zip' 'dos2unix' 'llvm' 'mingw-w64-gcc') # lfanew/debian/control
provides=("${pkgname%-git}=${pkgver%.r*}")
conflicts=("${pkgname%-git}")
_srcdir='lfanew'
source=(
  "git+${url}.git"
)
md5sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  set -u
  cd "${_srcdir}"
  printf '0.0.'
  git describe --long --tags --abbrev=7 | sed -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
  set +u
}

prepare() {
  set -u
  cd "${_srcdir}"

  local _pt
  for _pt in "${source[@]%%::*}"; do
    _pt="${_pt##*/}"
    if [[ "${_pt}" = *.patch ]]; then
      set +u; msg2 "Patch ${_pt}"; set -u
      patch -Nup1 -i "${srcdir}/${_pt}"
    fi
  done
  #cd ..; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; cd "${_srcdir}"; false
  #diff -pNaru5 'a' 'b' > '0000-new.patch'

  sed -e 's:mingw:min_disabled_gw:g' -i 'configure'

  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  ./configure --prefix='/usr'
  nice make # -j1
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make -j1 DESTDIR="${pkgdir}" install
  set +u
}
set +u
