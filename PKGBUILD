# Maintainer: James An <james@jamesan.ca>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Corrado Primier <cp663137@stud.polimi.it>

pkgname=drupal8
_pkgname=drupal
pkgver=8.0.0_beta1
pkgrel=1
pkgdesc="A PHP-based content management platform"
arch=('any')
url="http://www.drupal.org/"
license=('GPL')
depends=('php')
install='drupal8.install'
options=(!strip)
source=(http://www.drupal.org/files/projects/$_pkgname-${pkgver/_/-}.tar.gz)
md5sums=('9efea37c74bed8208133dc1aae76e53f')

package() {
  _instdir=$pkgdir/usr/share/webapps/drupal8
  mkdir -p ${_instdir}
  cd ${_instdir}
  cp -r $srcdir/$_pkgname-$pkgver/{*,.htaccess} ${_instdir}

  # move .htaccess
  mkdir -p $pkgdir/etc/webapps/drupal8
  sed -i '1,1iRequire all denied' ${_instdir}/.htaccess
  mv ${_instdir}/.htaccess $pkgdir/etc/webapps/drupal8/.htaccess
  ln -s /etc/webapps/drupal8/.htaccess ${_instdir}/.htaccess

  # move sites/
  mkdir -p $pkgdir/var/lib/drupal8/
  mv ${_instdir}/sites $pkgdir/var/lib/drupal8/sites
  ln -s /var/lib/drupal8/sites ${_instdir}/sites

  # apache config example
  cat >$pkgdir/etc/webapps/drupal8/apache.example.conf <<EOF
	Alias /drupal6 "/usr/share/webapps/drupal8"
	<Directory "/usr/share/webapps/drupal8">
		AllowOverride All
		Options FollowSymlinks
		Require all granted
		php_admin_value open_basedir "/srv/:/tmp/:/usr/share/webapps/:/etc/webapps:/usr/share/pear/:/var/lib/drupal8"
	</Directory>
EOF
}
