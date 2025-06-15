# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Sabart Otto - Seberm <seberm[at]gmail[dot]com>
# Contributor: Uzsolt

# TODO: Tighten up open_basedir to adminer folder only

if [ ! -s 'PKGBUILD.local' ]; then
  cat > 'PKGBUILD.local' << EOF
# adminer or another name for your link
_opt_WWWName='adminer' # default: adminer
#_opt_WWWName=''

# Supply a long hex code generated at https://www.grc.com/passwords.htm
# Your server will be at http://localhost/adminer-LONGHEXCODE/
# This will make it hard to find on a public facing server.
# Bookmark the address.
_opt_HexCode='' # default: blank
#opt_HexCode=''

# A change to either of these and you must restart httpd
EOF
fi
. 'PKGBUILD.local'

set -u
if [ ! -z "${_opt_HexCode}" ]; then
  _opt_HexCode="-${_opt_HexCode}"
fi

_pkgname='adminer'
pkgname="${_pkgname}-git"
pkgver=5.3.0.r0.g1cfc8451
pkgrel=1
pkgdesc='a web based SQL management tool supporting MySQL, PostgreSQL, SQLite, MS SQL, Oracle, Firebird, SimpleDB, Elasticsearch and MongoDB. Formerly phpMinAdmin.'
arch=('any')
url='https://www.adminer.org'
license=('Apache-2.0' 'GPL-2.0-only')
depends=('php>=7.0') # 5.1.0 last version compatible with php56
optdepends=('mariadb' 'apache' 'adminer-skins: various CSS skins for adminer' 'postgresql' 'sqlite: for sqlite3' 'sqlite2')
makedepends=('git')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
install="${_pkgname}.install"
_verwatch=("${url}" '/static/download/[0-9\.]\+/adminer-\([0-9\.]\+\).php' 'l')
source=("${pkgname}::git://adminer.git.sourceforge.net/gitroot/adminer/adminer")
sha256sums=('SKIP')

pkgver() {
  set -u
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed -e 's/^v//g' -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
  set +u
}

package() {
  set -u
  cd "${srcdir}/${pkgname}"

  install -d "${pkgdir}/usr/share/webapps/"
  cp -pR "${_pkgname}" "${pkgdir}/usr/share/webapps/"

  # .. is unreachable with our php_admin_value open_basedir limits.
  sed -i -e 's:../adminer/::g' $(grep -lr '../adminer/' "${pkgdir}/usr/share/webapps/")

  # Its similar to phpMyAdmin. I don't like opening up the entire /srv folder.
  install -Dpm644 <(cat << EOF
# Installed by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/
Alias /${_opt_WWWName}${_opt_HexCode} "/usr/share/webapps/${_pkgname}"
<Directory "/usr/share/webapps/${_pkgname}">
  AllowOverride All
  Options FollowSymlinks
    Require all granted
    php_admin_value open_basedir "/srv/:/tmp/:/usr/share/webapps/${_pkgname}/:/etc/webapps:/usr/share/pear/"
</Directory>
EOF
  ) "${pkgdir}/etc/webapps/${_pkgname}/apache.example.conf"

  install -Dpm644 "${pkgdir}/etc/webapps/${_pkgname}/apache.example.conf" "${pkgdir}/etc/httpd/conf/extra/httpd-${_pkgname}.conf"
  set +u
}
set +u
