# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com

set -u
pkgname='comcom32'
_pkgver='alpha-2'
pkgver="0.0.${_pkgver//-/_}"
pkgrel=1
pkgdesc='32 bit command interpreter for fdpp and dosemu2'
arch=('x86_64')
url='https://github.com/dosemu2/comcom32'
license=('GPL3')
makedepends=('djgpp-gcc' 'djgpp-djcrx')
conflicts=('djgpp-djcrx-bootstrap')
_srcdir="${pkgname%-git}-${_pkgver}"
source=(
  #"${url//https/git}"
  "${_srcdir}.tar.gz::${url}/archive/${_pkgver}.tar.gz"
)
md5sums=('8121352fdd1b9d701ce4ca9db50dd5d4')
sha256sums=('51e5bae2e04e5fc7328b94b064c0521c9bd89477d9e7d36495f8ad702dc92746')
b2sums=('03a5b098f7d7b95bac1b5598afe79b0261e1b46660a311123d454a61276d46bbbbec7e27264fc4a0f6ec3a358b2b321bfa89956e1a2f9e9657c95ae7893da1e0')

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
