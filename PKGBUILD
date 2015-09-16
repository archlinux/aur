# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: /dev/rs0 <rs0@secretco.de.com>

set -u
pkgname='joomscan'
pkgver='2012_03_10'
pkgrel='1'
pkgdesc='Detects file inclusion, sql injection, command execution vulnerabilities of a target Joomla! web site.'
arch=('any')
url="http://${pkgname}.sourceforge.net/"
license=('LGPL3')

depends=('perl-switch' 'perl-www-mechanize')
makedepends=('unzip')

_srcdir="${pkgname}-${pkgver}"
source=(
    'joomscan.sh'
    "http://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver//_/-}/${pkgname}-latest.zip"
)
noextract=("${source[1]##*/}")
sha256sums=('67de695ba7db7ef5864bd0c888dc9578de6a7139d4286ed4bc6ba42a486cda32'
            '7edbcf069fe60b032cd273d06de1f8c40459c65ae8e604602e8f60150f08ec6e')

prepare() {
  set -u
  unzip -oaq -d "${_srcdir%%/*}" "${source[1]##*/}"
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  install -Dpm0755 "${pkgname}.pl" "${srcdir}/${pkgname}.sh" -t "${pkgdir}/usr/share/${pkgname}/"
  install -Dpm0644 "${pkgname}"{db,db-info}.txt -t "${pkgdir}/usr/share/${pkgname}"

  mv 'report' "${pkgdir}/usr/share/${pkgname}"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  mv 'doc'/* "${pkgdir}/usr/share/doc/${pkgname}"

  install -d "${pkgdir}/usr/bin"
  ln -sf "/usr/share/${pkgname}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  install -d "${pkgdir}/usr/share/${pkgname}/doc"
  touch "${pkgdir}/usr/share/${pkgname}/doc/AGREEMENT"
  set +u
}
set +u
