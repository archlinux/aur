# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com

set -u
pkgname='fdpp'
#pkgname+='-git'
pkgver='1.1'
pkgrel='1'
pkgdesc='64 bit FreeDOS++ for dosemu2'
arch=('x86_64')
url='https://github.com/dosemu2/fdpp'
license=('GPL3')
depends=('gcc-libs' 'comcom32')
makedepends=('clang' 'nasm' 'lld')
_srcdir="${pkgname%-git}-${pkgver%.r*}"
source=(
  #"${url//https/git}"
  "${_srcdir}.tar.gz::${url}/archive/${pkgver}.tar.gz"
)
md5sums=('add617ab1f2e8f676bbf980dcabd9aa3')
sha256sums=('c6b0f75ced963824aa662a8c702252289678db5e16fe607cfc335e1aa6cd6ebb')
b2sums=('29dbafbcca92296fb8c37ed84bb2a793a474b8d8219b0b21599c3d7a9c7dbc53ebdda4e9d0aee9c52e12c2e7543d04eb36c4ee455df0290cfee961d283adb9d4')

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
