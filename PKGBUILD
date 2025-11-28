# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Chris Andrews <christophersimonandrews at gmail.com>
# Contributor: Dan Serban
# Contributors: Henri HÃ¤kkinenv, Damian Barberon, Netanel Shine, Simon Schneider
# Contributor: Lari Tikkanen <lartza at wippies.com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

set -u
pkgname='joomla'
pkgver='5.4.1'
pkgrel='1'
pkgdesc='a php Content Management System (CMS) which enables you to build websites and powerful online applications.'
arch=('any')
url='https://www.joomla.org/'
license=('GPL-2.0-only')
depends=('python')
#depends=('php<6')
optdepends=(
  'apache: Web server'
  'php: Web server support'
  'mariadb: Database'
  'postgresql: Database'
)
options=('!strip')
install="${pkgname}.install"
#_verwatch=("http://joomlacode.org/gf/project/${pkgname}/frs/" "Joomla_\(.*\)-Stable-Full_Package\.tar\.bz2" 't')
#source=("http://joomlacode.org/gf/download/frsrelease/20086/162538/Joomla_${pkgver}-Stable-Full_Package.tar.bz2")
_giturl="https://github.com/joomla/${pkgname}-cms"
#_verwatch=("${_giturl}/releases" "${_giturl}/releases/download/[0-9\.]\+/Joomla_\([0-9\.]\+\)-Stable-Full_Package\.tar\.bz2" 'l')
#_verwatch=("${_giturl}/releases.atom" '\s\+<title>Joomla! \([0-9.]\+\)<.*' 'f')
_srcdir="Joomla_${pkgver}-Stable-Full_Package"
source=("${_giturl}/releases/download/${pkgver}/${_srcdir}.tar.gz")
md5sums=('1a8ccb982caa964e0dacf7c5b71def49')
sha256sums=('7aafa6cb9e384206cc7b88b65f0121490a122e6d96f90f91496fafc52dad217d')
noextract=("${source[0]##*/}")

prepare() {
  set -u
  mkdir "${_srcdir}"
  bsdtar -C "${_srcdir}" -xf "${noextract[0]}"
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  install -dm755 "${pkgdir}/usr/share/webapps"
  cp -pr . "${pkgdir}/usr/share/webapps/joomla"
  find "${pkgdir}/usr/share/webapps/joomla" -maxdepth '1' -type 'l' -iname '*.bz2' -delete
  find "${pkgdir}/usr/share/webapps/joomla" -type 'f' -exec chmod 0664 '{}' '+'
  find "${pkgdir}/usr/share/webapps/joomla" -type 'd' -exec chmod 0775 '{}' '+'
  chown -R 'root:root' "${pkgdir}/usr/share/webapps/joomla"
  install -D 'LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  set +u
}
set +u
