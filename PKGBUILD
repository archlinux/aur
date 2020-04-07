# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com

set -u
pkgname='comcom32'
_pkgver='alpha-1'
pkgver="0.0.${_pkgver//-/_}"
pkgrel=1
pkgdesc='32 bit command interpreter for fdpp and dosemu2'
arch=('x86_64')
url='https://github.com/dosemu2/comcom32'
license=('GPL3')
makedepends=('djgpp-gcc')
_srcdir="${pkgname%-git}-${_pkgver}"
source=(
  #"${url//https/git}"
  "${_srcdir}.tar.gz::${url}/archive/${_pkgver}.tar.gz"
)
md5sums=('0add81902dc73791da76e311acaaaa5e')
sha256sums=('2ff27e3200ebaa0a147d5a9f3adaf7ab33d516717a031ffe4622be7ebd0962fd')
b2sums=('e3556e9a4df56dad5e6cf48e6e7f150ef8fc958ccfe4dfc4bc73d118ad93a697b7c43a0a3a0f1d0436940da1430356fbb43a5ab121efb5270242e040efc86759')

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

  sed -e '/^PREFIX / s:/usr/local:/usr:g' \
      -e 's:i586-pc:i686-pc:g' -i 'Makefile'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
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
