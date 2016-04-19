# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>

pkgname=lychee
pkgver=3.1.0
pkgrel=1
pkgdesc="Lychee is an easy to use and great looking photo-management-system."
arch=('any')
url="http://lychee.electerious.com/"
license=('MIT')
#depends=('exif' 'php-gd')
optdepends=('php-apache: to use the Apache web server'
	    'php-sqlite: to use the SQLite database backend'
	    'php-pgsql: to use the PostgreSQL database backend'
	    'mariadb: to use the MySQL database backend')
makedepends=()
options=('!strip')
backup=('etc/webapps/lychee/apache.example.conf')
source=("$pkgname-$pkgver.tar.gz::https://github.com//electerious/Lychee/archive/v$pkgver.tar.gz"
	'apache.example.conf')
sha256sums=('46d96ce7574176156ba0ee7937e4e1b4490e81b76a574ac6b186fdc0be8d7ac0'
	    'fe1400a1be9b60c4c8b6759b588638536188a73307cd061789877cd5fd491557')

prepare() {
  cd $srcdir/Lychee-$pkgver
  find . -type f -name .gitattributes -delete
  find . -type f -name .gitkeep -delete
  find . -type f -name .gitignore -delete
  find . -type f -name .gitmodules -delete
  find . -type f -name .travis.yml -delete
  find . -type d -name .git -exec rm -rf {} \;
}

package() {
  # install project
  install -d ${pkgdir}/usr/share/webapps/
  cp -a ${srcdir}/Lychee-$pkgver ${pkgdir}/usr/share/webapps/${pkgname}

  # install apache config file
  install -d  ${pkgdir}/etc/webapps/${pkgname}
  install -m 644 ${srcdir}/apache.example.conf  ${pkgdir}/etc/webapps/${pkgname}

  find ${pkgdir}/usr/share/webapps/${pkgname} -type f -exec chmod 0644 {} \;
  find ${pkgdir}/usr/share/webapps/${pkgname} -type d -exec chmod 0755 {} \;

  chmod -R 777 ${pkgdir}/usr/share/webapps/${pkgname}/data
  chmod -R 777 ${pkgdir}/usr/share/webapps/${pkgname}/uploads
}
