# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

# TODO: Improve .h files so spandsp plugin absense can be detected
# TODO: Fix auto_ptr

set -u
_pkgname='opal'
pkgname="${_pkgname}"
#pkgname+='-git'
pkgver=3.18.7
_pkgver="${pkgver%%.r[0-9]*}"
_opalver="${_pkgver}"
_ptlibver='2.18.7'
_pkgtitle=" Cygni/Stable ${pkgver##*.}"
pkgrel=1
pkgdesc='Open Phone Abstraction Library for h.323 h323 sip modem for Hylafax'
arch=('x86_64')
url='https://sourceforge.net/projects/opalvoip'
license=('GPL2')
depends=('brotli' 'bzip2' 'dbus' 'expat' 'fontconfig' 'freetype2' 'fribidi' 'gcc-libs' 'glib2' 'glibc' 'graphite' 'harfbuzz' 'icu' 'imagemagick' 'lcms2' 'libcap' 'libgcrypt' 'libgpg-error' 'libjpeg-turbo' 'libldap' 'liblqr' 'libnl' 'libpcap' 'libpng' 'libraqm' 'libsasl' 'libtool' 'libx11' 'libxau' 'libxcb' 'libxdmcp' 'libxext' 'libxml2' 'lua' 'lz4' 'ncurses' 'openssl' 'pcre' 'speexdsp' 'systemd-libs' 'unixodbc' 'xz' 'zlib' 'zstd' )
depends+=('speex' 'libvpx' 'opus')
depends+=('libsrtp')
depends+=('spandsp') # for t38modem faxing https://sourceforge.net/p/opalvoip/mailman/opalvoip-user/thread/AC931B7D-293F-4582-B873-69B0F5887EF0%40loca.net/#msg33202409
depends+=("ptlib>=${_ptlibver}")
_srcdir="${pkgname%-git}-${_pkgver}"
options=('!buildflags')
source=(
  "https://master.dl.sourceforge.net/project/opalvoip/v${_opalver%.*}${_pkgtitle// /%20}/${pkgname}-${_pkgver}.tar.bz2"
  '0000-opal-strncpy-BFCP_STRING_SIZE.patch'
)
md5sums=('SKIP'
         'e6e0e1c08fe908d63fad74fcf9e4d0e4')
sha256sums=('SKIP'
            'ac7194d760346b389ceec8554eaebe8f9effa4f36833e9ea57ced3180c2d2715')

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

prepare() {
  set -u
  cd "${_srcdir}"

  if [ "$(vercmp "${_pkgver}" '3.19.7')" -eq 0 ]; then
    #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
    # diff -pNaru5 'a' 'b' > '0000-opal-strncpy-BFCP_STRING_SIZE.patch'
    patch -Nup1 -i "${srcdir}/0000-opal-strncpy-BFCP_STRING_SIZE.patch"
  fi
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
    #CXXFLAGS+=' -std=c++14'
    ./configure --prefix='/usr' # CC='gcc-6' CXX='g++-6'
  fi
  nice make
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
