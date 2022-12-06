# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributor: Joseph R. Quinn <quinn period josephr at protonmail dot com>
# Contributor: Ewout van Mansom <ewout at vanmansom dot name>

pkgname=apache-h5bp-server-configs
_pkgname=server-configs-apache
pkgver=6.0.0
pkgrel=1
pkgdesc="Apache HTTP server boilerplate configs"
arch=('any')
url="https://github.com/h5bp/server-configs-apache"
license=('MIT')
depends=('apache')
provides=("$pkgname")
backup=(
  "etc/httpd/h5bp/errors/custom_errors.conf"
  "etc/httpd/h5bp/errors/error_prevention.conf"
  "etc/httpd/h5bp/media_types/character_encodings.conf"
  "etc/httpd/h5bp/media_types/media_types.conf"
  "etc/httpd/h5bp/security/permissions-policy.conf"
  "etc/httpd/h5bp/security/x-powered-by.conf"
  "etc/httpd/h5bp/security/x-content-type-options.conf"
  "etc/httpd/h5bp/security/cross-origin-policy.conf"
  "etc/httpd/h5bp/security/server_software_information.conf"
  "etc/httpd/h5bp/security/content-security-policy.conf"
  "etc/httpd/h5bp/security/trace_method.conf"
  "etc/httpd/h5bp/security/x-frame-options.conf"
  "etc/httpd/h5bp/security/referrer-policy.conf"
  "etc/httpd/h5bp/security/strict-transport-security.conf"
  "etc/httpd/h5bp/security/file_access.conf"
  "etc/httpd/h5bp/cross-origin/resource_timing.conf"
  "etc/httpd/h5bp/cross-origin/web_fonts.conf"
  "etc/httpd/h5bp/cross-origin/images.conf"
  "etc/httpd/h5bp/cross-origin/requests.conf"
  "etc/httpd/h5bp/rewrites/rewrite_www.conf"
  "etc/httpd/h5bp/rewrites/rewrite_nowww.conf"
  "etc/httpd/h5bp/rewrites/rewrite_http_to_https.conf"
  "etc/httpd/h5bp/rewrites/rewrite_engine.conf"
  "etc/httpd/h5bp/web_performance/content_transformation.conf"
  "etc/httpd/h5bp/web_performance/cache-control.conf"
  "etc/httpd/h5bp/web_performance/cache_expiration.conf"
  "etc/httpd/h5bp/web_performance/compression.conf"
  "etc/httpd/h5bp/web_performance/no_etags.conf"
  "etc/httpd/h5bp/web_performance/pre-compressed_content_brotli.conf"
  "etc/httpd/h5bp/web_performance/file_concatenation.conf"
  "etc/httpd/h5bp/web_performance/etags.conf"
  "etc/httpd/h5bp/web_performance/filename-based_cache_busting.conf"
  "etc/httpd/h5bp/web_performance/pre-compressed_content_gzip.conf"
  "etc/httpd/h5bp/tls/policy_strict.conf"
  "etc/httpd/h5bp/tls/certificate_files.conf"
  "etc/httpd/h5bp/tls/ocsp_stapling.conf"
  "etc/httpd/h5bp/tls/ssl_engine.conf"
  "etc/httpd/h5bp/tls/policy_balanced.conf"
  "etc/httpd/h5bp/basic.conf"
)
install='.install'
source=("${pkgname}.${pkgver}.tar.gz::https://github.com/h5bp/$_pkgname/archive/$pkgver.tar.gz")
b2sums=('6442a4bc9d4ec311fc0a0761524bc153febde2583e9cc763a7a8d06b553932633aac194ed7384fc10aa80da1245acfd2398b7e0f0a14b518d1cd38281c5c9676')

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
