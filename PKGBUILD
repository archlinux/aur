# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Sabart Otto - Seberm <seberm[at]gmail[dot].com
# Contributor: Uzsolt

[ ! -s 'PKGBUILD.local' ] && cat > 'PKGBUILD.local' << EOF
# adminer or another name for your link
_opt_WWWName='adminer' # default: adminer
#_opt_WWWName=''

# Supply a long hext code generated at https://www.grc.com/passwords.htm
# Your server will be at http://localhost/adminer-LONGHEXCODE/
# This will make it hard to find on a public facing server.
# Save your server as a link.
_opt_HexCode='' # default: blank
#opt_HexCode=''
EOF
. 'PKGBUILD.local'

set -u
test ! -z "${_opt_HexCode}" && _opt_HexCode="-${_opt_HexCode}"

_pkgname='adminer'
pkgname="${_pkgname}-git"
pkgver=4.2.2.r0.g596f8df
pkgrel=1
pkgdesc='a full-featured MySQL management tool written in PHP. Formerly phpMinAdmin.'
arch=('any')
url='http://www.adminer.org'
license=('Apache License, Version 2.0')
depends=('php')
optdepends=('mariadb' 'apache' 'adminer-skins: various CSS skins for adminer' 'postgresql' 'sqlite: for sqlite3' 'sqlite2')
makedepends=('git')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
install="${_pkgname}.install"
_verurl="${url}"
_versed='http://downloads.sourceforge.net/adminer/adminer-\([0-9\.]\+\).php'
_veropt='l'
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

  # Its similar to phpMyAdmin
  install -Dpm644 <(cat << EOF
# Installed by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# http://aur.archlinux.org/
Alias /${_opt_WWWName}${_opt_HexCode} "/usr/share/webapps/${_pkgname}"
<Directory "/usr/share/webapps/${_pkgname}">
  AllowOverride All
  Options FollowSymlinks
    Require all granted
    php_admin_value open_basedir "/srv/:/tmp/:/usr/share/webapps/:/etc/webapps:/usr/share/pear/"
</Directory>
EOF
  ) "${pkgdir}/etc/webapps/${_pkgname}/apache.example.conf"

  install -Dpm644 "${pkgdir}/etc/webapps/${_pkgname}/apache.example.conf" "${pkgdir}/etc/httpd/conf/extra/httpd-${_pkgname}.conf"
  #echo "Include conf/extra/httpd-${pkgname}.conf" >> ${pkgdir}/etc/httpd/conf/httpd.conf
  set +u
}
set +u
