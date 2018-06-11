pkgname=kerberosio-web
pkgver=2.5.1
pkgrel=1
pkgdesc="Kerberos.io machinery"
arch=('any')
url="https://github.com/kerberos-io/web"
license=('EULA')
groups=('system')
depends=('nginx' 'php-fpm' 'php-gd')
source=(${url}/releases/download/v${pkgver}/web.tar.gz)
md5sums=('322cc301050f1d17602b4cf82dfed34d')

package() {
	_dir="${pkgdir}/srv/http/kerberos"
	mkdir -p "${_dir}"
	tar -xf web.tar.gz -C "${_dir}"
	chown -R http:http "${_dir}"
	chmod -R 777 "${_dir}/storage"
	chmod 777 "${_dir}/config/kerberos.php"

	# Allow deprecated functions for php-7.1
	sed -i '2 a\
		error_reporting(E_ALL ^ E_DEPRECATED);' "${_dir}/config/app.php"

	# Fix document root
	for i in `grep -Rl /var/www`; do sed -i 's|/var/www|/srv/http/kerberos|' $i; done

	# Fix status of machinery
	sed -i 's/service kerberosio status/systemctl status kerberosio/' "${_dir}/app/Http/Repositories/System/OSSystem.php"
}
