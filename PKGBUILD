# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Contributor: Samuli Thomasson <samuli.thomasson@paivola.fi>

pkgname=agendav
pkgver=1.2.6.2
pkgrel=1
pkgdesc="Open source multilanguage CalDAV web client"
arch=(any)
url="http://agendav.org/"
license=('GPL')
depends=('php')
backup=("etc/webapps/agendav/config.php"
        "etc/webapps/agendav/caldav.php"
        "etc/webapps/agendav/database.php")
source=($pkgname-$pkgver.tar.gz::https://github.com/adobo/${pkgname}/archive/${pkgver}.tar.gz)
install=$pkgname.install
md5sums=('27269ed9aabbd3491061e3fc2541917c')

build() {
   true
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

   mkdir -p ${pkgdir}/etc/webapps/agendav

   install -D -m644 web/config/config.php.template   ${pkgdir}/usr/share/webapps/agendav/web/config/config.php
   install -D -m644 web/config/caldav.php.template   ${pkgdir}/usr/share/webapps/agendav/web/config/caldav.php
   install -D -m644 web/config/database.php.template ${pkgdir}/usr/share/webapps/agendav/web/config/database.php

   ln -s /usr/share/webapps/agendav/web/config/config.php   ${pkgdir}/etc/webapps/agendav/config.php  
   ln -s /usr/share/webapps/agendav/web/config/caldav.php   ${pkgdir}/etc/webapps/agendav/caldav.php  
   ln -s /usr/share/webapps/agendav/web/config/database.php ${pkgdir}/etc/webapps/agendav/database.php

   cat > ${pkgdir}/etc/webapps/agendav/nginx.example.conf <<EOF
   server {
      listen      80;
      server_name localhost;

      root /usr/share/webapps/agendav/web/public;

      location ~\.php$ {
         try_files      $uri = 404;
         fastcgi_pass   unix::/run/php-fpm/php-fpm.sock;
         fastcgi_index  index.php;
         include        fastcgi.conf;
      }

      location / {
         try_files $uri $uri/ /index.php;
      }
EOF

   cat > ${pkgdir}/etc/webapps/agendav/apache.example.conf <<EOF
   Alias /agendav "/usr/share/webapps/agendav/web/public"
   <Directory "/usr/share/webapps/agendav">
      Options FollowSymlinks
      AllowOverride All
      Order allow,deny
      Allow from all
   </Directory>
EOF

   find . -type f -exec install -D -m644 {,${pkgdir}/usr/share/webapps/agendav/}{} \;

   cd ${pkgdir}/usr/share/webapps/agendav/web/application
   ln -s ../config ./config
}
