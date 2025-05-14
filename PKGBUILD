# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com

set -u
pkgname='dj64-git'
pkgver=0.0.r4268.8652119
pkgrel=1
pkgdesc='djgpp 64 bit compiler'
arch=('x86_64')
url='https://github.com/stsp/dj64dev'
license=('GPL-3.0-or-later')
depends=('glibc' 'libelf' 'bash')
makedepends=('djstub' 'git' 'thunk_gen' 'ctags')
makedepends+=('autoconf-archive')
provides=("${pkgname%-git}=${pkgver%.r*}")
conflicts=("${pkgname%-git}")
_srcdir='dj64dev'
source=(
  "git+${url}.git"
  #'0001-src-makefile-misc-exe.patch'
)
md5sums=('SKIP')
sha256sums=('SKIP')

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

  local _seds=(
    -e '/^PREFIX \?=/ s:/usr/local:/usr:g'
    -e '/^prefix \?=/ s:/usr/local:/usr:g'
  )
  sed -E "${_seds[@]}" -i $(grep --include 'makefile' -rle '/usr/local')

  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  if [ ! -s 'configure' ]; then
    autoreconf -v -i
  fi
  if [ ! -s 'Makefile.conf' ]; then
    ./configure --prefix='/usr'
  fi
  nice -n1 make
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make -j1 DESTDIR="${pkgdir}" install
  set +u
}
set +u
