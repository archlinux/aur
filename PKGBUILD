# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com

set -u
pkgname='fdpp'
pkgver='1.0'
pkgrel='1'
pkgdesc='64 bit FreeDOS++ for dosemu2'
arch=('x86_64')
url='https://github.com/dosemu2/fdpp'
license=('GPL3')
depends=('gcc-libs' 'comcom32')
makedepends=('clang' 'nasm')
_srcdir="${pkgname%-git}-${pkgver}"
source=(
  #"${url//https/git}"
  "${_srcdir}.tar.gz::${url}/archive/${pkgver}.tar.gz"
)
md5sums=('caa712341a4340c0243ad76e6767ed06')
sha256sums=('0533e19dec5ca04b36f49f6dcb1296f299dea673a3011a7e20a5e29675304470')
b2sums=('40c446ee7fb5a6fdc8829a0639edd8e211fcda3abfed3bdde2d3ce830874bd4dd810b7be48d5a9afe460cd89ece2e6d9d1a12fea6c7282cd8273e8181baa907c')

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
