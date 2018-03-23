# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: megadriver <megadriver at gmx dot com>
# Based on lynx from [extra]
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

set -u
_pkgname=lynx
pkgname="${_pkgname}-current"
_basever='2.8.9'
pkgver="${_basever}dev.17"
pkgrel='1'
pkgdesc='A text browser for the World Wide Web (current development version)'
arch=('i686' 'x86_64')
#url='http://lynx.isc.org/'
url='http://lynx.invisible-island.net'
license=('GPL')
depends=('openssl' 'ncurses' 'libidn')
provides=("${_pkgname}=${_basever}")
conflicts=("${_pkgname}")
backup=('etc/lynx.cfg')
_verwatch=("http://invisible-mirror.net/archives/lynx/tarballs/?C=M;O=D" "${_pkgname}\(.*\)\.tar\.bz2" 'l')
#source=("http://lynx.isc.org/current/${_pkgname}${pkgver}.tar.bz2") #{,.asc})
#_srcdir="lynx${_basever//./-}"
_srcdir="lynx${pkgver}"
source=("http://invisible-mirror.net/archives/lynx/tarballs/${_pkgname}${pkgver}.tar.bz2") #{,.asc})
sha256sums=('a43811b9078c46ccd6d91a3d5ae0a8bc1f247a4dd89c1a6ccdbcd6c2b3d56ed3')
#validpgpkeys=('0AFD1FFEEA2EA063B959ACDA5DDF8FB7688E31A6')

prepare() {
  set -u
  cd "${_srcdir}"
  ./configure --prefix='/usr' \
    --sysconfdir='/etc' \
    --with-ssl='/usr' \
    --enable-nls \
    --enable-ipv6 \
    --enable-default-colors \
    --mandir='/usr/share/man'
  sed -e 's:/usr/sbin/:/usr/bin/:g' -i 'lynx.cfg'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  make -s -j1 # not compatible with threaded make
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make DESTDIR="${pkgdir}" install

  # FS#20404 - points to local help
  sed -e 's|^HELPFILE.*$|HELPFILE:file:///usr/share/doc/lynx/lynx_help/lynx_help_main.html|' -i "${pkgdir}/etc/lynx.cfg"

  install -d "${pkgdir}/usr/share/doc/lynx"
  cp -rf 'lynx_help' "${pkgdir}/usr/share/doc/lynx"
  set +u
}
set +u
