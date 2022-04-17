# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com

set -u
pkgname='comcom32'
#pkgname+='-git'
_pkgver='alpha-3'
# pkgver="0.0.${_pkgver//-/_}" # copy this line
pkgver="0.0.${_pkgver//-/_}"
pkgrel='1'
pkgdesc='32 bit command interpreter for fdpp and dosemu2'
arch=('x86_64')
url='https://github.com/dosemu2/comcom32'
license=('GPL3')
makedepends=('djgpp-gcc' 'djgpp-djcrx')
conflicts=('djgpp-djcrx-bootstrap')
_srcdir="${pkgname%-git}-${_pkgver%.r*}"
source=(
  "${_srcdir}.tar.gz::${url}/archive/${_pkgver}.tar.gz"
)
md5sums=('6b97ffae13786144b4a037477c744fe5')
sha256sums=('ff9e878f9e3948e26a2ffd279c46d4193af114f43c087e96714fbba28831aaea')
b2sums=('3c2e9cfe94e7acd01f282af1a5140ee61d430496802aa55dcc20ba26cda409c911cf39d37322dd1d55bfad8b23409219b77f976b2cc9a8e7fd49a5058530da2c')

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
  printf '0.0.%s' "$(git describe --tags --long | sed -e 's:^v::g' -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g')"
}
else
  if [ "${pkgver%.r*}" != "${pkgver}" ]; then
    echo "pkgver must be manually restored to non git version (see comment): ${pkgver}"
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
