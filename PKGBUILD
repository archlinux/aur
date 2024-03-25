# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com

set -u
pkgname='comcom32'
#pkgname+='-git'
_pkgver='alpha-3'
# pkgver="0.0.${_pkgver//-/_}" # copy this line
pkgver="0.0.${_pkgver//-/_}"
pkgrel=1
pkgdesc='32 bit command interpreter for fdpp and dosemu2'
arch=('any')
url='https://github.com/dosemu2/comcom64'
license=('GPL-3.0-or-later')
makedepends=('djgpp-gcc' 'djgpp-djcrx')
conflicts=('djgpp-djcrx-bootstrap')
_srcdir="comcom64-${_pkgver%.r*}"
source=(
  "${_srcdir}.tar.gz::${url}/archive/${_pkgver}.tar.gz"
)
md5sums=('f3843e66fd37be94865620730ef91655')
sha256sums=('24a90d3142498ea3f48e6874d94af7c0158419e2c0fee4754c159d46c69fb088')
b2sums=('b5f5d4057c1dd8305f33184f43da9460a4c4d76696cc9ce598fe2f37d6648a2ae5546926bc3c2d98f3910ffc87d1a4217729d3f2f5bfe678bdc14bd74e673d0c')

if [ "${pkgname%-git}" != "${pkgname}" ]; then
  source[0]="git+${url}.git" #commit=ef0fdeb44158d1ef8850767890cd970186737340"
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
