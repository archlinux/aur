# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com

set -u
pkgname='fdpp'
_pkgver='rc-1'
pkgver="0.0.${_pkgver//-/_}"
pkgrel=1
pkgdesc='64 bit FreeDOS++ for dosemu2'
arch=('x86_64')
url='https://github.com/dosemu2/fdpp'
license=('GPL3')
depends=('gcc-libs' 'comcom32')
makedepends=('clang' 'nasm')
_srcdir="${pkgname%-git}-${_pkgver}"
source=(
  #"${url//https/git}"
  "${_srcdir}.tar.gz::${url}/archive/${_pkgver}.tar.gz"
)
md5sums=('15afb3b453302d2eb251f60070d81236')
sha256sums=('96c9d2b2462e4ed1a3c0a296a76fa94e80b9b9970b7b84e4f4c7c74b507aacad')
b2sums=('9c02df022c5527d29971447d164662cda70b47ffc5ef2d0b783a1217fb4579534442e791c8cf679ad0850cad69e93d5dd43ae94a6e55816bbc9e867fb6c86715')

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
