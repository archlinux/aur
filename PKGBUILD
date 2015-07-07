# Maintainer : Foppe HEMMINGA <foppe@foppe.org>
# Contributer: David Zaragoza <david@zaragoza.com.ve>
# Contributed once, and has a ridiculous ego about it: GI_Jack <iamjacksemail@hackermail.com>
pkgname=teampass
pkgver=2.1.22
pkgrel=2
pkgdesc="A Collaborative Passwords Manager"
arch=('any')
url="http://www.teampass.net/"
license=('AGPL3')
depends=('mysql' 'php' 'php-mcrypt')
optdepends=('php-ldap: if using LDAP identification')
source=("https://github.com/nilsteampassnet/TeamPass/archive/${pkgver}.zip")
sha256sums=('ae9488a673d88d7951ad396b0563d90fd49e94b70690d4bfd75fedcb33d8ed86')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/share/webapps/${pkgname}"
  install -d "${pkgdir}/etc/webapps/${pkgname}"
  cp -r "${srcdir}/TeamPass-${pkgver}/*" "${pkgdir}/usr/share/webapps/teampass"
  cd "$pkgdir/usr/share/webapps/teampass"
  chown http:http install includes files upload

  # Apache configuration
  cat > "${pkgdir}/etc/webapps/${pkgname}/apache.example.conf" <<EOF
Alias /teampass "/usr/share/webapps/teampass"
<Directory "/usr/share/webapps/teampass">
    AllowOverride All
    Options FollowSymlinks
    Require all granted
    php_admin_value open_basedir "/srv/:/tmp/:/usr/share/webapps/:/etc/webapps:/usr/share/pear/"
</Directory>
EOF
}

# vim:set ts=2 sw=2 et:
