# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

# This must be test built on a GUI system where additional libraries will be detected

# TODO: Improve .h files so spandsp plugin absense can be detected
# TODO: Fix auto_ptr

# PTLIB,OPAL seem to be OpenSSL 3 compatible
# Use same setting in PTLIB,OPAL
# ''    Use system openssl
# '-1.1' Use version 1.1
#_opt_OPENSSL='-1.1'
_opt_OPENSSL=''

set -u
_pkgname='opal'
pkgname="${_pkgname}"
#pkgname+='-git'
#pkgver=3.18.7
pkgver=3.18.8
_pkgver="${pkgver%%.r[0-9]*}"
_opalver="${_pkgver}"
_ptlibver='2.18.8'
_pkgtitle=" Cygni/Stable ${pkgver##*.}"
pkgrel=1
pkgdesc='Open Phone Abstraction Library for h.323 h323 sip modem for Hylafax'
arch=('x86_64')
url='https://sourceforge.net/projects/opalvoip'
license=('MPL-1.0')
depends=('glibc' 'gcc-libs')
depends+=('speex' 'speexdsp' 'libvpx' 'opus')
depends+=('libsrtp')
depends+=('spandsp') # for t38modem faxing https://sourceforge.net/p/opalvoip/mailman/opalvoip-user/thread/AC931B7D-293F-4582-B873-69B0F5887EF0%40loca.net/#msg33202409
depends+=('libtheora')
depends+=("ptlib>=${_ptlibver}")
makedepends+=("openssl${_opt_OPENSSL}")
makedepends+=('swig')
_srcdir="${pkgname%-git}-${_pkgver}"
#options=('!buildflags')
source=(
  "https://master.dl.sourceforge.net/project/opalvoip/v${_opalver%.*}${_pkgtitle// /%20}/${pkgname}-${_pkgver}.tar.bz2"
)
md5sums=('1f48ea0bef4b0731b4af19928eb02c36')
sha256sums=('acbeb8c03cd10ea0dfbf59d8e0bd8118352f285fbce137404682b42f9d5a3f42')

if [ "${_pkgname}" != "${pkgname}" ]; then
  _srcdir="${_pkgname}"
  source[0]="${_srcdir}::git://git.code.sf.net/p/opalvoip/${_pkgname}"
  #source[0]+="#branch=${_pkgverb}"
  makedepends+=('git')
  md5sums[0]='SKIP'
  sha256sums[0]='SKIP'
  provides=("${_pkgname}=${_pkgver}")
  conflicts=("${_pkgname}")
pkgver() {
  set -u
  cd "${_srcdir}"
  local _major="$(sed -E -n -e 's:^.*MAJOR_VERSION ([0-9]+):\1:p' 'version.h')"
  local _minor="$(sed -E -n -e 's:^.*MINOR_VERSION ([0-9]+):\1:p' 'version.h')"
  local _patch="$(sed -E -n -e 's:^.*PATCH_VERSION ([0-9]+):\1:p' 'version.h')"
  printf '%s.%s.%s.r%s.g%s' "${_major}" "${_minor}" "${_patch}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  set +u
}
elif [ "${_pkgver}" != "${pkgver}" ]; then
pkgver() {
  printf '%s' "${_pkgver}"
}
fi

# $1 = version sta '3.18.8'
# $2 = comparison '-ge 0'
# optional to allow for a between range
# $3 = version end '3.21.0'
# $4 = comparison '-lt 0'
# return 0 for comparison success, 1 for comparison failed
# Version patching doesn't work when switching to -git because pkgver() runs after prepare()
_vercmp() {
  local _rv='0'
  if [ ! "$(vercmp "${pkgver}" "$1")" $2 ]; then
    _rv='1'
  elif [ "$#" -eq 4 ] && [ ! "$(vercmp "${pkgver}" "$3")" $4 ]; then
    _rv='1'
  fi
  printf '%s\n' "${_rv}"
}

_vctest() {
  local pkgver='2.18.8'
  _vercmp '2.18.8' '-eq 0'
  _vercmp '2.18.7' '-eq 0'
  local pkgver='2.21.0'
  _vercmp '2.18.8' '-ge 0' '2.21.0' '-lt 0'
}
#_vctest; exit 1

prepare() {
  set -u
  cd "${_srcdir}"
  declare -A _vca=(
    #[0000]="$(_vercmp '2.19.7' '-eq 0')"
  )
  local _f
  for _f in "${source[@]}"; do
    _f="${_f%%::*}"
    _f="${_f##*/}"
    if [[ "${_f}" = *.patch ]]; then
      if [ "${_vca[${_f%%-*}]:-0}" -eq 0 ]; then
        set +u; msg2 "Patch ${_f}"; set -u
        patch -Nup1 -i "${srcdir}/${_f}"
      else
        set +u; msg2 "skipped Patch ${_f}"; set -u
      fi
    fi
  done
  #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; cd "${_srcdir}"; false
  # diff -pNaru5 'a' 'b' > 'new.patch'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  if [ ! -s 'config.log' ]; then
    #if [ "$(vercmp "${_pkgver}" '3.16')" -le 0 ]; then
    #  CFLAGS+=' -fcommon'
    #  CPPFLAGS+=' -Wno-error=stringop-truncation'
    #fi
    #CXXFLAGS+=' -std=c++11'
    local _conf=(
      # CC='gcc-6' CXX='g++-6'
      --prefix='/usr'
      --enable-cpp17
      --disable-libavcodec # 3.18.8, not a trivial patch: "ffmpeg.cxx:111:3: error: ‘avcodec_register_all’ was not declared in this scope"
    )
    if [ ! -z "${_opt_OPENSSL}" ]; then
      # -I is pulled from PTLIB. -L was missed
      LDFLAGS+=" -L/usr/lib/openssl${_opt_OPENSSL}"
    fi
    ./configure "${_conf[@]}" # 2>&1 | tee "${startdir}/lg_conf_${pkgver}.log"
  fi
  nice make # 2>&1 | tee "${startdir}/lg_make_${pkgver}.log"
  set +u
}

check() {
  set -u
  cd "${_srcdir}"
  local _f
  for _f in $(grep --include 'Makefile' -l -r -e 'runtest'); do
    set +u; msg2 "Test ${_f%Makefile}"; set -u
    make -C "${_f%Makefile}" runtest
  done
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make -s -j1 DESTDIR="${pkgdir}" install
  find "${pkgdir}/usr/lib" -name '*.a' -exec chmod 644 '{}' ';'
  set +u
}

set +u
