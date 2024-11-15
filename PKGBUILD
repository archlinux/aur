# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com

_opt_bits=64 # 32 or 64

#djgpp for 32 bit:
#djgpp-djcrx-bootstrap
#djgpp-binutils
#djgpp-gcc
#djgpp-djcrx

#dj64 for 64 bit:
#lfanew,smallerc,thunk_gen
#djstub
#dj64
#comcom64
#and possibly fdpp,dosemu2

set -u
pkgname='comcom32'
#pkgname+='-git'
_pkgver='alpha-3'
_opt_commit='#commit=6cca478862e3d25f5fdad6aba7804934d4ab72ec' # only applies to non git
# pkgver="0.0.${_pkgver//-/_}" # copy this line and set _opt_commit
pkgver="0.0.${_pkgver//-/_}" # copy this line and set _opt_commit
pkgrel=2
pkgdesc="${_opt_bits} bit command interpreter for fdpp and dosemu2"
arch=('any')
url='https://github.com/dosemu2/comcom64'
license=('GPL-3.0-or-later')
if [ "${_opt_bits}" -eq 32 ]; then
  makedepends=('djgpp-gcc' 'djgpp-djcrx')
  conflicts=('djgpp-djcrx-bootstrap')
else
  makedepends=('dj64' 'git' 'thunk_gen' 'djstub')
fi
conflicts+=("comcom64")
provides+=("comcom64=${pkgver%%.r*}")
_srcdir="comcom64-${_pkgver%.r*}"
source=(
  "${_srcdir}.tar.gz::${url}/archive/${_pkgver}.tar.gz"
)
md5sums=('e88107a6cefb8cd4565c4a747e840c8f')
sha256sums=('35f60a46b97c106a24c43920dc2c23e4f127d5b0e89f03157edefd1714c7a44b')
b2sums=('7dff12078ef8d59ed53f3d674f835478111ead5ac61a568ce3c936efc1bcce34c36b4ff26cf3c39146888ea50033efcd150f3ad19d4bc171350a3d2d52133842')

if [ "${pkgname%-git}" != "${pkgname}" ]; then
  _opt_commit=''
fi
if [ "${pkgname%-git}" != "${pkgname}" ] || [ ! -z "${_opt_commit}" ]; then
  source[0]="git+${url}.git${_opt_commit}"
  md5sums[0]='SKIP'
  sha256sums[0]='SKIP'
  b2sums[0]='SKIP'
  makedepends+=('git')
  conflicts+=("${pkgname%-git}")
  provides+=("${pkgname%-git}=${pkgver%%.r*}")
  _srcdir="comcom64"
  #source[0]="comcom64.severach::git+https://github.com/severach/comcom64.git${_opt_commit}"; _srcdir+='.severach'
if [ "${pkgname%-git}" != "${pkgname}" ]; then
pkgver() {
  cd "${_srcdir}"
  printf '0.0.%s' "$(git describe --tags --long | sed -e 's:^v::g' -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g')"
}
fi
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
  local _seds=(
    -e '/^PREFIX / s:/usr/local:/usr:g'
      -e 's:i586-pc:i686-pc:g'
  )
  sed -E "${_seds[@]}" -i 'Makefile'
  if [ -d '../32' ]; then
    sed -E "${_seds[@]}" -i '../32/Makefile'
  fi
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  if [ -s '32' ]; then
    nice make "${_opt_bits}"
  else
    nice make
  fi
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  if [ "${_opt_bits}" -eq 32 ]; then
    make -C '32' -j1 DESTDIR="${pkgdir}" install
  else
    make -j1 DESTDIR="${pkgdir}" install
  fi
  set +u
}
set +u
