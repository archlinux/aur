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
pkgver="${_basever}dev.6"
pkgrel='1'
pkgdesc='A text browser for the World Wide Web (current development version)'
url='http://lynx.isc.org/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('openssl' 'ncurses' 'libidn')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${_basever}")
backup=('etc/lynx.cfg')
_verwatch=("${url}current/" "/current/${_pkgname}\(.*\)\.tar\.bz2" 'l')
source=("http://lynx.isc.org/current/${_pkgname}${pkgver}.tar.bz2") #{,.asc})
sha256sums=('3e1f3e8c0df19de9b3d26d6f221b6789dab3ee1302c9cf7a888efcc186f373b5')
#validpgpkeys=('0AFD1FFEEA2EA063B959ACDA5DDF8FB7688E31A6')

prepare() {
  set -u
  cd "${srcdir}/lynx${_basever//./-}"
  ./configure --prefix='/usr' \
    --sysconfdir='/etc' \
    --with-ssl='/usr' \
    --enable-nls \
    --enable-ipv6 \
    --enable-default-colors \
    --mandir='/usr/share/man'
  sed -i -e 's:/usr/sbin/:/usr/bin/:g' 'lynx.cfg'
  set +u
}

build() {
  set -u
  cd "${srcdir}/lynx${_basever//./-}"
  make -s # -j "$(nproc)" # not compatible with threaded make
  set +u
}

package() {
  set -u
  cd "${srcdir}/lynx${_basever//./-}"
  make DESTDIR="${pkgdir}" install

  # FS#20404 - points to local help
  sed -i -e 's|^HELPFILE.*$|HELPFILE:file:///usr/share/doc/lynx/lynx_help/lynx_help_main.html|' "${pkgdir}/etc/lynx.cfg"

  install -d "${pkgdir}/usr/share/doc/lynx"
  cp -rf 'lynx_help' "${pkgdir}/usr/share/doc/lynx"
  set +u
  # Ensure there are no forbidden paths. Place at the end of package() and comment out as you find or need exceptions. (git-aurcheck)
  ! test -d "${pkgdir}/bin" || { echo "Line ${LINENO} Forbidden: /bin"; false; }
  ! test -d "${pkgdir}/sbin" || { echo "Line ${LINENO} Forbidden: /sbin"; false; }
  ! test -d "${pkgdir}/lib" || { echo "Line ${LINENO} Forbidden: /lib"; false; }
  ! test -d "${pkgdir}/share" || { echo "Line ${LINENO} Forbidden: /share"; false; }
  ! test -d "${pkgdir}/usr/sbin" || { echo "Line ${LINENO} Forbidden: /usr/sbin"; false; }
  ! test -d "${pkgdir}/usr/local" || { echo "Line ${LINENO} Forbidden: /usr/local"; false; }
  ! grep -lr "/sbin" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /sbin"; false; }
  ! grep -lr "/usr/tmp" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /usr/tmp"; false; }
  # A bunch of config instructions
  #! grep -lr "/usr/local" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /usr/local"; false; }
  # Not references to /bin
  #! pcre2grep -Ilr "(?<!/usr)/bin" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /bin"; false; }
}
set +u
