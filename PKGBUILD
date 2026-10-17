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

true "${QUIET:=}" "${logpipe:=}"

set -u
pkgname='comcom32'
#pkgname+='-git'
_pkgver='0.5'
_opt_commit=''
#_opt_commit="#tag=${_pkgver}" # only applies to non git
#_opt_commit='#commit=1ce86cee50940875dc7f6b74915faa01f6967097' # only applies to non git
# pkgver="0.0.${_pkgver//-/_}" # copy this line and set _opt_commit
pkgver="0.0.${_pkgver//-/_}"
pkgrel=1
pkgdesc="${_opt_bits} bit command interpreter for fdpp and dosemu2"
arch=('any')
url='https://github.com/dosemu2/comcom64'
license=('GPL-3.0-or-later')
if [ "${_opt_bits}" -eq 32 ]; then
  makedepends=('djgpp-gcc' 'djgpp-djcrx')
  conflicts=('djgpp-djcrx-bootstrap')
else
  makedepends=('dj64' 'git' 'thunk_gen')
  makedepends+=('djstub')
fi
conflicts+=("comcom64")
provides+=("comcom64=${pkgver%%.r*}")
#options=('!buildflags' '!lto')
_srcdir="comcom64-${_pkgver%.r*}"
source=(
  "${_srcdir}.tar.gz::${url}/archive/${_pkgver}.tar.gz"
)
md5sums=('bcfbe063b1163ae2853680a9d3b8a11b')
sha256sums=('7dd7f5db57309fdd25e13dc47f23eeeb5b85260aae9d9618ba6f1ea47c6fb13a')

if [ "${pkgname%-git}" != "${pkgname}" ]; then
  _opt_commit=''
fi
if [ "${pkgname%-git}" != "${pkgname}" ] || [ ! -z "${_opt_commit}" -a "${_opt_commit/#tag/}" = "${_opt_commit}" ]; then
  source[0]="git+${url}.git${_opt_commit}"
  #source[0]+="#commit=ba9908e6679844823517a1ba22b1e09a1aa5867e"
  #source[0]+="#commit=5ab4c838a0d5e1a51bcc2f6d49fa7ec45ea46b7a"
  #source[0]+="#commit=747d1bd757e2bb9fb9e1d90a7dfa4cddce7cca15"
  #source[0]+="#commit=747d1bd757e2bb9fb9e1d90a7dfa4cddce7cca15"
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
  local -; set -u
  cd "${_srcdir}"

  local _pt
  for _pt in "${source[@]%%::*}"; do
    _pt="${_pt##*/}"
    if [[ "${_pt}" = *.patch ]]; then
      set +u; msg2 "Patch ${_pt}"; set -u
      patch -Nup1 -i "${srcdir}/${_pt}"
    fi
  done

if ! :; then
  if [ -d 'src' ]; then
    cd 'src'
  fi
  local _seds=(
    -e '/^PREFIX \?=/ s:/usr/local:/usr:g'
    -e '/^prefix \?=/ s:/usr/local:/usr:g'
    -e 's:i586-pc:i686-pc:g'
  )
  sed -E "${_seds[@]}" -i ?akefile
  if [ -d '../32' ]; then
    sed -E "${_seds[@]}" -i ../32/?akefile
  fi
fi
  #sed -e 's:CPPFLAGS:CFLAGS:g' -i src/?akefile
}

build() {
  local -; set -u
  cd "${_srcdir}"
  if [ "${_opt_bits}" -eq '32' ]; then
    nice make "${_opt_bits}" prefix='/usr'
  else
    unset CFLAGS CPPFLAGS LDFLAGS
    export prefix='/usr' PREFIX='/usr'
    nice make
  fi
}

package() {
  local -; set -u
  cd "${_srcdir}"
  if [ "${_opt_bits}" -eq 32 ]; then
    make -C '32' -j1 DESTDIR="${pkgdir}" install
  else
    make -j1 DESTDIR="${pkgdir}" install
  fi
  set +u
  #if [ ! -s "${pkgdir}/usr/share/comcom64/comcom64.exe" ]; then
  #  printf 'Build failed missing comcom64.exe\n' 1>&2
  #  false
  #fi
  if [ -d "${pkgdir}/usr/local" ]; then
    printf 'Build failed with /usr/local\n' 1>&2
    false
  fi
}
set +u
