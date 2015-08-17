# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>

pkgname=drupal7
_pkgname=drupal
pkgver=7.35
pkgrel=1
pkgdesc="A PHP-based content management platform"
arch=('any')
url="http://www.drupal.org/"
license=('GPL')
depends=('php')
install="${pkgname}.install"
source=(http://www.drupal.org/files/projects/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('0bc0a5fef14aa7086eb5cef7893d90c9b4826aade43d17d35c200af6bc3e3268d9bbc3158ef666657cb68763f4c1b381e27df11e8a49d91b2905f7bac658978d')

package() {
  _instdir=${pkgdir}/usr/share/webapps/${pkgname}
  mkdir -p ${_instdir}
  cd ${_instdir}
  cp -r ${srcdir}/${_pkgname}-${pkgver}/{*,.htaccess} ${_instdir}

  # move .htaccess
  mkdir -p ${pkgdir}/etc/webapps/${pkgname}
  sed -i '1,1iRequire all denied' ${_instdir}/.htaccess
  mv ${_instdir}/.htaccess ${pkgdir}/etc/webapps/${pkgname}/.htaccess
  ln -s /etc/webapps/${pkgname}/.htaccess ${_instdir}/.htaccess

  # move sites/
  mkdir -p ${pkgdir}/var/lib/${pkgname}/
  mv ${_instdir}/sites ${pkgdir}/var/lib/${pkgname}/sites
  ln -s /var/lib/${pkgname}/sites ${_instdir}/sites

  # apache config example
  cat >${pkgdir}/etc/webapps/${pkgname}/apache.example.conf <<EOF
	Alias /${pkgname} "/usr/share/webapps/${pkgname}"
	<Directory "/usr/share/webapps/${pkgname}">
		AllowOverride All
		Options FollowSymlinks
		Require all granted
		php_admin_value open_basedir "/srv/:/tmp/:/usr/share/webapps/:/etc/webapps:/usr/share/pear/:/var/lib/${pkgname}"
	</Directory>
EOF
}
