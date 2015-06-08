# Maintainer: Arthur Zamarin <arthurzam@gmail.com>
# Contributor: James An <james@jamesan.ca>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Corrado Primier <cp663137@stud.polimi.it>

pkgname=drupal6
_pkgname=drupal
pkgver=6.33
pkgrel=1
pkgdesc="A PHP-based content management platform"
arch=('any')
url="http://www.drupal.org/"
license=('GPL')
depends=('php')
install='drupal6.install'
options=(!strip)
source=(http://www.drupal.org/files/projects/$_pkgname-$pkgver.tar.gz)
sha256sums=('952f9bd6b22058fe8f9c90c0ac96bd695a673306331269a79c7e19e38fd047eb')

package() {
  _instdir=$pkgdir/usr/share/webapps/drupal6
  mkdir -p ${_instdir}
  cd ${_instdir}
  cp -r $srcdir/$_pkgname-$pkgver/{*,.htaccess} ${_instdir}

  # move .htaccess
  mkdir -p $pkgdir/etc/webapps/drupal6
  sed -i '1,1iRequire all denied' ${_instdir}/.htaccess
  mv ${_instdir}/.htaccess $pkgdir/etc/webapps/drupal6/.htaccess
  ln -s /etc/webapps/drupal6/.htaccess ${_instdir}/.htaccess

  # move sites/
  mkdir -p $pkgdir/var/lib/drupal6/
  mv ${_instdir}/sites $pkgdir/var/lib/drupal6/sites
  ln -s /var/lib/drupal6/sites ${_instdir}/sites

  # apache config example
  cat >$pkgdir/etc/webapps/drupal6/apache.example.conf <<EOF
	Alias /drupal6 "/usr/share/webapps/drupal6"
	<Directory "/usr/share/webapps/drupal6">
		AllowOverride All
		Options FollowSymlinks
		Require all granted
		php_admin_value open_basedir "/srv/:/tmp/:/usr/share/webapps/:/etc/webapps:/usr/share/pear/:/var/lib/drupal6"
	</Directory>
EOF
}
