# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Foppe HEMMINGA <foppe@foppe.org>
# Contributor: David Zaragoza <david@zaragoza.com.ve>
# Contributor: GI_Jack <iamjacksemail@hackermail.com>

pkgname=teampass
pkgver=2.1.27.10
pkgrel=1
pkgdesc="A Collaborative Passwords Manager"
arch=('any')
url="http://www.teampass.net/"
license=('AGPL3')
depends=('mysql' 'php' 'php-mcrypt')
optdepends=('php-ldap: if using LDAP identification')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nilsteampassnet/TeamPass/archive/${pkgver}.tar.gz")
sha256sums=('c1580b9f398b21b2ce5bcf97040e5fbbf386fef8c84df4cd9f7a562918f404aa')

package() {
  cd "${srcdir}"
  install -d "${pkgdir}/usr/share/webapps/${pkgname}"
  install -d "${pkgdir}/etc/webapps/${pkgname}"
  install -D -m644 "${srcdir}/TeamPass-${pkgver}/license.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cp -r "${srcdir}/TeamPass-${pkgver}/"* "${pkgdir}/usr/share/webapps/teampass"
  cd "${pkgdir}/usr/share/webapps/teampass"
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
