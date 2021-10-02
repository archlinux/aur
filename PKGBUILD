# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributor: Joseph R. Quinn <quinn period josephr at protonmail dot com>
# Contributor: Ewout van Mansom <ewout at vanmansom dot name>

pkgname=apache-h5bp-server-configs
_pkgname=server-configs-apache
pkgver=5.0.0
pkgrel=1
pkgdesc="Apache HTTP server boilerplate configs"
arch=('any')
url="https://github.com/h5bp/server-configs-apache"
license=('MIT')
depends=('apache')
provides=("$pkgname")
install='.install'
source=("${pkgname}.${pkgver}.tar.gz::https://github.com/h5bp/$_pkgname/archive/$pkgver.tar.gz")
b2sums=('cb0dba07237fd098ff797300dde52ba1072b071ae7c2cc7e7edc317fcc4f5cfcc5442b12d6d982c6c2d72c8df33e910a574d005104690f21dcc94acc93a34d06')

prepare() {
	cd "$_pkgname-$pkgver"

  sed -i '/ServerRoot/s_"/usr/local/apache2"_"/etc/httpd"_' 'httpd.conf'
  sed -i '/User/s/www-data/http/' 'httpd.conf'
  sed -i '/Group/s/www-data/http/' 'httpd.conf'
  sed -i '/ErrorLog/s_logs/error.log_/var/log/httpd/error\_log_' 'httpd.conf'
  sed -i '/CustomLog/s_logs/access.log_/var/log/httpd/access\_log_' 'httpd.conf'
  sed -i '/SSLSessionCache/s_"shmcb:/usr/local/apache2/logs/ssl\_gcache\_data(10485760)"_"shmcb:/run/httpd/ssl\_scache(10485760)"_' 'httpd.conf'
  
  sed -i '/SSLStaplingCache/s_shmcb:/var/run/ocsp(128000)_shmcb:/run/httpd/ssl\_stapling(128000)_' 'h5bp/tls/ocsp_stapling.conf'
}

package() {
	cd "$_pkgname-$pkgver"
	install -d "$pkgdir/etc/httpd/conf"
	install -Dm644 httpd.conf "$pkgdir/etc/httpd/conf/httpd.conf.example"
	mv h5bp "$pkgdir/etc/httpd"
	mv vhosts "$pkgdir/etc/httpd"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
