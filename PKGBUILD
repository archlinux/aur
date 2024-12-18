# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com

set -u
pkgname='djstub-git'
pkgver=0.0.r131.c96e090
pkgrel=1
pkgdesc='Stub for dj64'
arch=('x86_64')
url='https://github.com/stsp/djstub'
license=('GPL-3.0-or-later')
depends=('glibc' 'bash')
makedepends=('smallerc' 'lfanew' 'git' 'nasm')
provides=("${pkgname%-git}=${pkgver%.r*}")
conflicts=("${pkgname%-git}")
_srcdir='djstub'
source=(
  "git+${url}.git"
)
md5sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  set -u
  cd "${_srcdir}"
  printf "0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
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

  local _seds=(
    -e '/^PREFIX \?=/ s:/usr/local:/usr:g'
    -e '/^prefix \?=/ s:/usr/local:/usr:g'
  )
  sed -E "${_seds[@]}" -i 'Makefile'

  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  make
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make -j1 DESTDIR="${pkgdir}" install
  set +u
}
set +u
