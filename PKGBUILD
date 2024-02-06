# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

# This must be test built on a GUI system where additional libraries will be detected

# Compiling up to 2.21 now

# PTLIB,OPAL seem to be OpenSSL 3 compatible
# Use same setting in PTLIB,OPAL
# ''    Use system openssl
# '-1.1' Use version 1.1
#_opt_OPENSSL='-1.1'
_opt_OPENSSL=''

set -u
_pkgname='ptlib'
pkgname="${_pkgname}"
#pkgname+='-git'
#pkgver=2.18.7
pkgver=2.18.8
_pkgver="${pkgver%%.r[0-9]*}"
#_opalver='3.18.7'
_opalver='3.18.8'
_ptlibver="${_pkgver}"
_pkgtitle=" Cygni/Stable ${pkgver##*.}"
pkgrel=1
pkgdesc='Portable Tools Libary for opal'
arch=('x86_64')
url='https://sourceforge.net/projects/opalvoip'
license=('MPL-1.0')
depends=('glibc' 'gcc-libs')
depends+=('libjpeg-turbo' 'libpcap' 'unixodbc' 'imagemagick' 'lua53' 'libsasl' 'libldap' 'ncurses' 'expat')
depends+=("openssl${_opt_OPENSSL}")
depends+=('alsa-lib')
#depends+=('sdl2') # --disable-sdl needs work in 2.18.7, works in 2.18.8
#depends+=('gstreamer' 'gst-plugins-base-libs' 'glib2') # -disable-gstreamer
optdepends=('sdl2' 'gstreamer' 'gst-plugins-base-libs' 'glib2' 'ffmpeg' 'libavc1394' 'libdv')
_srcdir="${pkgname%-git}-${_pkgver}"
#options=('!buildflags') # 2.18.7 Assertion fail: Possible deadlock in timed mutex
source=(
  "https://master.dl.sourceforge.net/project/opalvoip/v${_opalver%.*}${_pkgtitle// /%20}/${pkgname}-${_pkgver}.tar.bz2"
  '0001-openmamba-0003-ptlib-2.18.8-gcc-12.2.0.patch' # https://openmamba.org/en/packages/?tag=devel&pkg=ptlib.source
  #'0002-revert-unique_ptr-to-auto_ptr.patch' # The new unique_ptr doesn't work yet with opal or t38modem
  '0002-object.h-update-unique_ptr.patch'
  '0003-mediafile.cxx-FFMPEG.patch'
)
md5sums=('207f40521cde54a9c4e1e31a9cd8a101'
         '8513fdfe31f811086861961ebb64ce8c'
         '702d25c16cd0fba8e8b4f048fe52f1aa'
         '6777ede8e6ce74aa2f9585e4cc4c3cdf')
sha256sums=('da15c6d53629857adac754259566f282dd9fe985ea57e182acc5f8644648e66c'
            '6ac212048d96ef785dd43c65308dc52056d02394a59b608b98e179942ad383c1'
            '34edcb17b49fa6fffbc8e60f3c360a459632630d543e5e7a3041ed35585b1626'
            '82f19c27b15287e095c2907c20e75e82966c0c218f46693e337f5535be390c8a')

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
# return 1 for comparison fail, 0 for comparison success
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
    [0002]="$(_vercmp '2.18.8' '-ge 0' '2.20.0' '-lt 0')"
  )
  _vca[0003]="${_vca[0002]}"
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

  # Based on https://build.opensuse.org/package/view_file/openSUSE:Factory/ptlib/libpt2-fix-avc-plugin.patch?expand=1
  # Needed for at least 2.18.8 to 2.21.0, possibly more
  local _seds=()
  for _f in frameWidth frameHeight colourFormat deviceName channelNumber videoFormat converter nativeVerticalFlip; do
    _seds+=(-e "s:\b${_f}\b:m_&:g")
  done
  sed -E "${_seds[@]}" -i 'plugins/vidinput_avc/vidinput_avc.cxx'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  if [ ! -s 'config.log' ]; then
    local _conf=(
      #--disable-imagemagick
      #--disable-openssl
      #--disable-ipv6
      # CC='gcc-6' CXX='g++-6'
      --prefix='/usr'
      --enable-cpp17      # 2.18.8 defaults to -std=c++03
      # (patched) --disable-avc       # 2.18.8-2.21.0: "vidinput_avc.cxx:138:3: error: ‘frameWidth’ was not declared in this scope; did you mean ‘m_frameWidth’?"
      #--disable-sdl       # Compiles: Typically not available in CLI install
      #--disable-gstreamer # Compiles: Typically not available in CLI install
    )
    if [ ! -z "${_opt_OPENSSL}" ]; then
      _conf+=(
        OPENSSL_CFLAGS="-I/usr/include/openssl${_opt_OPENSSL}"
        OPENSSL_LIBS="-L/usr/lib/openssl${_opt_OPENSSL} -lssl"
        --disable-openldap # uses current version of openssl
      )
    fi
    #if [ "$(vercmp "${pkgver}" "2.20.0")" -lt 0 ]; then
    #  # no switch for --disable-FFMPEG --disable-libavcodec
    #  # 2.18.8. "mediafile.cxx:781:7: error: ‘AVCodecContext’ does not name a type; did you mean ‘AVIODirContext’?"
    #  sed -e 's:HAS_FFMPEG=1:HAS_FFMPEG=0:g' -i 'configure'
    #  sed -e 's:avformat\.h:avformat_disabled.h:g' -i 'configure.ac'
    #fi
    ./configure "${_conf[@]}" # 2>&1 | tee "${startdir}/lg_conf_${pkgver}.log"
  fi
  nice make # 2>&1 | tee "${startdir}/lg_make_${pkgver}.log"
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make -s -j1 DESTDIR="${pkgdir}" install
  find "${pkgdir}" -type 'f' -exec chmod 'u+w' '{}' '+'
  find "${pkgdir}/usr/lib" -type 'f' -name '*.a' -exec chmod 644 '{}' '+'
  rmdir "${pkgdir}/usr/bin"
  set +u
}

set +u
