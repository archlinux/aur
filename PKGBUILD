# Maintainer: Zeph <zeph33@gmail.com>
pkgname=bizou
pkgver=1.7
pkgrel=1
pkgdesc="Bizou - a (french) KISS php image gallery"
arch=('any')
url="http://positon.org/bizou/"
license=('GPLv3')
depends=('php' 'php-gd')
makedepends=()
options=('!strip')
source=("http://positon.org/bizou/${pkgname}_v${pkgver}.tar.gz")
backup=('etc/webapps/bizou/config.php')
md5sums=('7ad2151722b65495d41eaf2e4b61508c')

package() {
	# install project
	install -o http -g http -d ${pkgdir}/usr/share/webapps/
	cp -a ${srcdir}/${pkgname} ${pkgdir}/usr/share/webapps/
	chown -R http:http ${pkgdir}/usr/share/webapps/${pkgname}

	# install config file
	install -d  ${pkgdir}/etc/webapps/${pkgname}

	# move config to /etc
	mv ${pkgdir}/usr/share/webapps/${pkgname}/config.php ${pkgdir}/etc/webapps/${pkgname}/config.php
	chown -R http:http ${pkgdir}/etc/webapps/${pkgname}/config.php
	ln -s /etc/webapps/${pkgname}/config.php ${pkgdir}/usr/share/webapps/${pkgname}/config.php
	cat >$pkgdir/etc/webapps/bizou/apache.example.conf <<EOF
		Alias /bizou "/usr/share/webapps/bizou"
		<Directory "/usr/share/webapps/bizou">
			AllowOverride All
			Options FollowSymlinks
			Order allow,deny
			Allow from all
			php_admin_value open_basedir "/srv/:/tmp/:/usr/share/webapps/:/etc/webapps:/usr/share/pear/"
		</Directory>
EOF
	cat >$pkgdir/etc/webapps/bizou/nginx.example.conf <<EOF
	# redirect http to https.
	server {
	  listen 80;
	  server_name bizou.example.org;
	  return 301 https://$server_name$request_uri;  # enforce https
	}

	# bizou (ssl/tls)
	server {
		listen 443 ssl;
		ssl_certificate /etc/nginx/certs/server.crt;
		ssl_certificate_key /etc/nginx/certs/server.key;
		server_name bizou.example.org;
		root /usr/share/webapps/bizou;
		index index.php;

		# deny direct access
		location ~ ^/(config|\.ht) {
			deny all;
		}
		access_log /var/log/nginx/stats.access.log;
		error_log /var/log/nginx/stats.error.log;

		# enable php
		location ~ \.php$ {
			fastcgi_pass 127.0.0.1:9000; # or use php-fpm with: "unix:/var/run/php-fpm/php-fpm.sock;"
			fastcgi_param HTTPS on;
			fastcgi_index index.php;
			include fastcgi.conf;
		}
	}
EOF

}
