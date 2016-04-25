# $Id$
# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Andreas Pieber <anpieber@gmail.com>

set -u
pkgname='liquibase'
pkgver='3.5.0'
pkgrel='1'
pkgdesc='VCS source control tailored for database management'
arch=('any')
url="http://www.liquibase.org/"
license=('Apache')
depends=('java-environment')
_giturl="https://github.com/liquibase/${pkgname}"
_verwatch=("${_giturl}/releases" "${_giturl#*github.com}/releases/download/liquibase-parent-[^/]\+/liquibase-\([0-9\.]\+\)-bin.tar.gz" 'l')
options=('!strip')
source=("https://github.com/liquibase/${pkgname}/releases/download/liquibase-parent-${pkgver}/liquibase-${pkgver}-bin.tar.gz"
        "liquibase.profile")
sha256sums=('942208064b208900b8949bd9eaf50f5dd67849e87fa826dc0cb01d9da935626b'
            '7c1939e5b1aee63db199c86989726bbdf81102784512ed69f8595fddf80c30c0')

package() {
  set -u
  # install profile file
  #install -Dpm644 "${srcdir}/liquibase.profile" "${pkgdir}/etc/profile.d/liquibase.sh"
  # sed makes it easy to not forget our underprivileged csh users
  #install -Dpm644 <(sed -e 's:export :setenv :g' -e 's:=: :g' "${srcdir}/liquibase.profile") "${pkgdir}/etc/profile.d/liquibase.csh"

  # This binary link removes the need for the profile files that require a logout to make work
  install -d "${pkgdir}/usr/bin"
  ln -sf '/opt/liquibase/liquibase' "${pkgdir}/usr/bin/liquibase"

  # create folders
  install -d "${pkgdir}/opt/liquibase"

  # move liquibase tar content to /opt/liquibase
  find "${srcdir}/." -maxdepth 1 -not -type l -not -name '*.' -exec mv '{}' "${pkgdir}/opt/liquibase/" ';'
  #cp -r ${srcdir}/* ${pkgdir}/opt/liquibase

  # make liquibase executable
  chmod 755 "${pkgdir}/opt/liquibase/liquibase"

  # remove files for other platforms
  rm -f "${pkgdir}/opt/liquibase"/{liquibase.bat,liquibase.spec}

  install -d "${pkgdir}/usr/share/licenses/${pkgbase}/"
  ln -sf '/opt/liquibase/LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE.txt"
  set +u
}
set +u
