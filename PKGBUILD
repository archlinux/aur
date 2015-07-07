# Maintainer: Foppe HEMMINGA <foppe@foppe.org>
# Contributer: Guten Ye

pkgname=icinga-web
pkgver=1.13.0
pkgrel=1
pkgdesc="Icinga New Web Interface."
license=('GPL')
arch=('i686' 'x86_64')
depends=('php-pear' 'php-xsl' 'php-ldap')
optdepends=('icinga' 'icinga2')
url="http://www.icinga.org"
source=("https://github.com/Icinga/icinga-web/releases/download/v$pkgver/icinga-web-${pkgver}.tar.gz"
	"nginx.example.conf")

build() {
  cd "$srcdir/$pkgname-$pkgver"

	./configure  \
		--prefix=/usr/share/icinga-web \
		--with-web-user=http \
		--with-web-group=http \
		--with-web-apache-path=/etc/httpd/conf/extra \
		--with-db-socket=/run/mysqld/mysqld.sock \
		--with-conf-dir=/etc/icinga-web \
		--with-log-dir=/var/log/icinga \
		--with-cache-dir=/var/cache/icinga-web \
		--with-icinga-bin=/usr/bin \
		--with-icinga-cfg=/etc/icinga \
		--with-icinga-objects-dir=/etc/icinga/objects \
		--with-api-cmd-file=/var/spool/icinga/rw/icinga.cmd \
		--with-enable-sla
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

 	install -Dm644 etc/apache2/icinga-web.conf "$pkgdir/etc/icinga-web/apache.example.conf"
	install -Dm644 ../nginx.example.conf "$pkgdir/etc/icinga-web/nginx.example.conf"

	mkdir -p "$pkgdir/usr/share/webapps"
	ln -s /usr/share/icinga-web/lib "$pkgdir/usr/share/icinga-web/pub/js"
	ln -s /usr/share/icinga-web/pub "$pkgdir/usr/share/webapps/icinga-web"
}

md5sums=('0a63ae3c2c1d7cdd5f1362373f696578' 
         'b8f56703a0a6a8b05b9fae070d407ce7')
