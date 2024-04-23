# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com

set -u
pkgname='comcom32'
#pkgname+='-git'
_pkgver='alpha-3'
# pkgver="0.0.${_pkgver//-/_}" # copy this line
pkgver=0.0.alpha.3.r282.g2147a36
pkgrel=1
pkgdesc='64 bit command interpreter for fdpp and dosemu2 (comcom64)'
arch=('any')
url='https://github.com/dosemu2/comcom64'
license=('GPL-3.0-or-later')
#makedepends=('djgpp-gcc' 'djgpp-djcrx')
makedepends=('dj64' 'git' 'thunk_gen' 'djstub')
#conflicts=('djgpp-djcrx-bootstrap')
conflicts+=("comcom64")
provides+=("comcom64=${pkgver%%.r*}")
_srcdir="comcom64-${_pkgver%.r*}"
source=(
  "${_srcdir}.tar.gz::${url}/archive/${_pkgver}.tar.gz"
)
md5sums=('f3843e66fd37be94865620730ef91655')
sha256sums=('24a90d3142498ea3f48e6874d94af7c0158419e2c0fee4754c159d46c69fb088')

if [ "${pkgname%-git}" != "${pkgname}" ] || :; then
  source[0]="git+${url}.git#commit=2147a36f7136c17fdfdcdc37a15d2c3527abfb4b"
  md5sums[0]='SKIP'
  sha256sums[0]='SKIP'
  b2sums[0]='SKIP'
  conflicts+=("${pkgname%-git}")
  provides+=("${pkgname%-git}=${pkgver%%.r*}")
  _srcdir="comcom64"
pkgver() {
  cd "${_srcdir}"
  printf '0.0.%s' "$(git describe --tags --long | sed -e 's:^v::g' -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g')"
}
else
  if [ "${pkgver%.r*}" != "${pkgver}" ]; then
    echo "pkgver must be manually restored to non git version (see line to copy): ${pkgver}"
    exit 1
  fi
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

  if [ -d 'src' ]; then
    cd 'src'
  fi
  sed -e '/^PREFIX / s:/usr/local:/usr:g' \
      -e 's:i586-pc:i686-pc:g' -i 'Makefile'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  nice make
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make -j1 DESTDIR="${pkgdir}" install
  set +u
}
set +u
