# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com

set -u
pkgname='dj64-git'
pkgver=0.0.r3697.4b7e4f9
pkgrel=1
pkgdesc='djgpp 64 bit compiler'
arch=('x86_64')
url='https://github.com/stsp/dj64dev'
license=('GPL-3.0-or-later')
depends=('glibc' 'libelf' 'bash')
makedepends=('djstub' 'git' 'thunk_gen' 'ctags')
provides=("${pkgname%-git}=${pkgver%.r*}")
conflicts=("${pkgname%-git}")
_srcdir='dj64dev'
source=(
  "git+${url}.git"
  '0001-src-makefile-misc-exe.patch'
)
md5sums=('SKIP'
         'bfccaead6a72a30c3e099da50cd220a6')
sha256sums=('SKIP'
            '065a875c1ea2f76dd621d8f38d17a67919582f3f6881b50ca1bee35faeea0764')

pkgver() {
  set -u
  cd "${_srcdir}"
  printf '0.0.r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
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

  sed -E -e '/^PREFIX \?=/ s:/usr/local:/usr:g' -i 'makefile'

  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  nice make -j1
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make -j1 DESTDIR="${pkgdir}" install
  set +u
}
set +u
