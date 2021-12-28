# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com

set -u
pkgname='fdpp'
#pkgname+='-git'
pkgver=1.4
pkgrel=1
pkgdesc='64 bit FreeDOS++ for dosemu2'
arch=('x86_64')
url='https://github.com/dosemu2/fdpp'
license=('GPL3')
depends=('gcc-libs' 'comcom32')
makedepends=('clang' 'nasm' 'lld')
_srcdir="${pkgname%-git}-${pkgver%.r*}"
source=(
  #"${url//https/git}"
  "${_srcdir}.tar.gz::${url}/archive/${pkgver%%.r*}.tar.gz"
)
md5sums=('58a08524b95364236df12dbeb020d939')
sha256sums=('5df1e6db0385e0fe87307b8174a424afaf6c55cd6da21d20d4bf4ac223e7520b')
b2sums=('e791c08b0074b7ba5430413fb6950a94a6e67af39590c64022d6bf157075f184bd1b5cfe125c11df6b82d691a3b8aedf1cc3ec8f418d9b9c2a5ff47ec70810ed')

if [ "${pkgname%-git}" != "${pkgname}" ]; then
  source[0]="git+${url}.git"
  md5sums[0]='SKIP'
  sha256sums[0]='SKIP'
  b2sums[0]='SKIP'
  conflicts+=("${pkgname%-git}")
  provides+=("${pkgname%-git}=${pkgver%%.r*}")
  _srcdir="${pkgname%-git}"
pkgver() {
  cd "${_srcdir}"
  git describe --tags --long | sed -e 's:^v::g' -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
}
elif [ "${pkgver%.r*}" != "${pkgver}" ]; then
pkgver() {
  echo "${pkgver%.r*}"
}
fi

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

  sed -e '/^PREFIX / s:/usr/local:/usr:g' -i 'fdpp/defs.mak'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  bash -e -u configure
  make -j "$(nproc)"
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make -j1 DESTDIR="${pkgdir}" install
  set +u
}
set +u
