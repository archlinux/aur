# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: megadriver <megadriver at gmx dot com>
# Based on lynx from [extra]
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

set -u
_pkgname=lynx
pkgname="${_pkgname}-current"
_basever='2.9.2'
pkgver="${_basever}"
pkgrel='1'
pkgdesc='A text browser for the World Wide Web (current development version)'
arch=('i686' 'x86_64')
#url='http://lynx.isc.org/'
url='http://lynx.invisible-island.net'
license=('GPL-2.0-only')
depends=('glibc' 'openssl' 'ncurses' 'libidn2' 'zlib' 'brotli' 'bzip2' 'libbsd')
provides=("${_pkgname}=${_basever}")
conflicts=("${_pkgname}")
backup=('etc/lynx.cfg')
#_verwatch=("http://invisible-mirror.net/archives/lynx/tarballs/?C=M;O=D" "${_pkgname}\(.*\)\.tar\.bz2" 'l')
#source=("http://lynx.isc.org/current/${_pkgname}${pkgver}.tar.bz2") #{,.asc})
#_srcdir="lynx${_basever//./-}"
_srcdir="lynx${pkgver%rel.0}"
source=("https://invisible-mirror.net/archives/lynx/tarballs/${_pkgname}${pkgver%rel.0}.tar.bz2") #{,.asc})
md5sums=('3ce01505e82626ca4d7291d7e649c4c9')
sha256sums=('7374b89936d991669e101f4e97f2c9592036e1e8cdaa7bafc259a77ab6fb07ce')
#validpgpkeys=('0AFD1FFEEA2EA063B959ACDA5DDF8FB7688E31A6')

_configure() {
  set -u
  cd "${_srcdir}"
  sed -e 's:/usr/sbin/:/usr/bin/:g' -i 'lynx.cfg'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  if [ ! -s 'Makefile' ]; then
    local _conf=(
      --prefix='/usr'
      --sysconfdir='/etc'
      --with-ssl='/usr'
      --enable-nls
      --enable-ipv6
      --enable-default-colors
      --mandir='/usr/share/man'
    )
    ./configure "${_conf[@]}"
  fi
  make -s -j1 # not compatible with threaded make
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make -s -j1 DESTDIR="${pkgdir}" install

  # FS#20404 - points to local help
  sed -e 's|^HELPFILE.*$|HELPFILE:file:///usr/share/doc/lynx/lynx_help/lynx_help_main.html|' -i "${pkgdir}/etc/lynx.cfg"

  install -d "${pkgdir}/usr/share/doc/lynx"
  cp -rf 'lynx_help' "${pkgdir}/usr/share/doc/lynx"
  set +u
}
set +u
