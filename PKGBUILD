# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Sabart Otto - Seberm <seberm[at]gmail[dot]com>

# TODO: The editor is stuck in the first database and won't let me into any others.

if [ ! -s 'PKGBUILD.local' ]; then
  cat > 'PKGBUILD.local' << EOF
# adminer-editor or another name for your link
_opt_WWWName='adminer-editor' # default: adminer-editor
#_opt_WWWName=''

# Supply a long hex code generated at https://www.grc.com/passwords.htm
# Your server will be at http://localhost/adminer-editor-LONGHEXCODE/
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

_pkgname='adminer-editor'
pkgname="${_pkgname}"
pkgver='5.4.0'
pkgrel='1'
pkgdesc='Database data editing tool written in PHP'
arch=('any')
url='https://www.adminer.org/en/editor/'
license=('Apache-2.0')
depends=('php')
optdepends=('mariadb' 'apache' 'postgresql' 'sqlite' 'sqlite2')
_verwatch=("${url}" '/static/download/[0-9\.]\+/editor-\([0-9\.]\+\).php' 'l')
options=('!strip')
install="${_pkgname}.install"
#source=("http://downloads.sourceforge.net/adminer/editor-${pkgver}.php")
source=("https://www.adminer.org/static/download/${pkgver}/editor-${pkgver}.php")
md5sums=('8132f132f0ac24f7aea421291ed56743')
sha256sums=('bb67e0eca977205f0fd5e217b47c1028e4539d493ba5e363274e1ec01db3b513')

package() {
  set -u

  install -Dpm644 "${srcdir}/editor-${pkgver}.php" "${pkgdir}/usr/share/webapps/${_pkgname}/index.php"

  # Its similar to phpMyAdmin
  install -Dpm644 <(cat << EOF
# Installed by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/
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
  set +u
}
set +u
