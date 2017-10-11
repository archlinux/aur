# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Gatien Bovyn <gatien.bovyn@gmail.com>
# Contributor: Guy Martin <gmsoft@tuxicoman.be>

# TODO: A systemd service
# TODO: How to fix registry: Configuration "startup" not found in the database

# This package functions as a server only.
# To use you must install the console or the webui interface

set -u
_pkgname='pom-ng'
pkgname="${_pkgname}-git"
pkgver=0.0.19.r0.g48da973
pkgrel=1
pkgdesc='Packet-o-Matic real time network packet capture forensic tool'
arch=('i686' 'x86_64')
url='http://www.packet-o-matic.org/'
license=('GPL')
depends=('libxml2' 'libmicrohttpd' 'xmlrpc-c' 'lua51' 'uthash' 'file' 'libpcap' 'zlib' 'libexif' 'sqlite')
optdepends=(
  'libjpeg: analyze jpeg images'
  'libexif: parse exif data from jpeg images'
  "${_pkgname}-webui: view and manage from a browser"
  "${_pkgname}-console: view and manage from a console"
  "${_pkgname}-addons"
  #'postgresql: store configurations and other (pick one)' # These will be enabled when postgre is supported. For now sqlite is required.
  #'sqlite: store configurations and other (pick one)'
)
makedepends=('git' 'gcc' 'binutils' 'make' 'libtool' 'pkg-config')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_srcdir="${pkgname^^}"
_giturl="https://github.com/gmsoft-tuxicoman/${_pkgname}"
_verwatch=("${_giturl}/releases.atom" '\s\+<title>v\([^<]\+\).*' 'f') # RSS
source=("${_srcdir}::${_giturl//https:/git:}.git")
sha256sums=('SKIP')

pkgver () {
  set -u
  cd "${_srcdir}"
  git describe --long --tags | sed -e 's:^v::g' -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
  set +u
}

prepare() {
  set -u
  cd "${_srcdir}"
  autoreconf -f -i
  lua_CFLAGS="$(pkg-config --cflags lua51)" \
  lua_LIBS="$(pkg-config --libs lua51)" \
  ./configure --prefix='/usr'
  #cp -p '/usr/include/libexif/exif-data.h' .
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  if [ ! -z "${MAKEFLAGS:-}" ] && [ "${MAKEFLAGS}" != "${MAKEFLAGS//-j/}" ]; then
    nice make -s
  else
    local _nproc="$(lscpu -p | grep '^[0-9]' | cut -d',' -f2-3 | sort -u | wc -l)"; _nproc=$((_nproc>4?4:_nproc))
    nice make -s -j "${_nproc}"
  fi
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make -j1 DESTDIR="${pkgdir}" install
  install -d "${pkgdir}/usr/share/${_pkgname}/addons"
  set +u
}
set +u
