# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
_pkgname='ptlib'
pkgname="${_pkgname}"
#pkgname+='-git'
pkgver=2.18.7
_pkgver="${pkgver%%.r[0-9]*}"
_opalver='3.18.7'
_ptlibver="${_pkgver}"
_pkgtitle=" Cygni/Stable ${pkgver##*.}"
pkgrel=1
pkgdesc='Portable Tools Libary for opal'
arch=('x86_64')
url='https://sourceforge.net/projects/opalvoip'
license=('GPL2')
depends=('brotli' 'bzip2' 'dbus' 'expat' 'fontconfig' 'freetype2' 'fribidi' 'gcc-libs' 'glib2' 'glibc' 'graphite' 'harfbuzz' 'icu' 'imagemagick' 'lcms2' 'libcap' 'libgcrypt' 'libgpg-error' 'libjpeg-turbo' 'libldap' 'liblqr' 'libnl' 'libpcap' 'libpng' 'libraqm' 'libsasl' 'libtool' 'libx11' 'libxau' 'libxcb' 'libxdmcp' 'libxext' 'libxml2' 'lua' 'lz4' 'ncurses' 'openssl' 'pcre' 'systemd-libs' 'unixodbc' 'xz' 'zlib' 'zstd')
depends+=('alsa-lib')
#depends+=('sdl2') # needs work
_srcdir="${pkgname%-git}-${_pkgver}"
options=('!buildflags') # PTLib Assertion fail: Possible deadlock in timed mutex
source=(
  "https://master.dl.sourceforge.net/project/opalvoip/v${_opalver%.*}${_pkgtitle// /%20}/${pkgname}-${_pkgver}.tar.bz2"
)
md5sums=('c27179a28f1170ec0320105a2aa7e013')
sha256sums=('258c8385e34fd0f182fbcdd139acd3a9a5f5bdada3445136371cb1bff0038097')

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

build() {
  set -u
  cd "${_srcdir}"
  if [ ! -s 'config.log' ]; then
    #CXXFLAGS+=' -std=c++14'
    ./configure --prefix='/usr' #--disable-ipv6 # CC='gcc-6' CXX='g++-6'
  fi
  nice make
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make -s -j1 DESTDIR="${pkgdir}" install
  find "${pkgdir}/usr/lib" -name '*.a' -exec chmod 644 '{}' ';'
  rmdir "${pkgdir}/usr/bin"
  set +u
}

set +u
