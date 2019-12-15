# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
projectname=pterodactyl
pkgname=pterodactyl-panel
pkgname1=panel
githuborg=pterodactyl
pkgdesc="Open-source game server management panel"
pkgver=0.7.15
pkgpath="github.com/${githuborg}/${pkgname1}"
pkgrel=5
arch=('any')
url="https://${pkgpath}"
license=()
makedepends=()
#https://pterodactyl.io/community/installation-guides/daemon/debian10.html#install-requirements
depends=(mariadb mariadb-clients php php-gd php-fpm redis composer dialog)
source=("${url}/releases/download/v${pkgver}/${pkgname1}.tar.gz"
pterodactyl.conf
pterodactyl-panel.sh)
sha256sums=('0beb6e5c5056255fc34eb199127a24d412bd66d3a6622b311b763adb14629c4b'
            '9c412eb73baff0ba32cb15e8b86e52b40ec5a3fda5768e6b034b08ccbf2edc75'
            '8ac1252a2357927bd95f5091502907e1b7d6a335b8809e9f49d8dbbce306f244')

build() {
cd ${srcdir}/${pkgname1}-${pkgver}
cp .env.example .env
composer install --no-interaction --no-dev --prefer-dist --optimize-autoloader
cd ${srcdir}
echo -e "# Pterodactyl Queue Worker File
# ----------------------------------
[Unit]
Description=Pterodactyl Queue Worker
After=redis-server.service

[Service]
# On some systems the user and group might be different.
# Some systems use `apache` or `nginx` as the user and group.
User=http
Group=http
Restart=always
ExecStart=/usr/bin/php /var/www/pterodactyl/artisan queue:work --queue=high,standard,low --sleep=3 --tries=3

[Install]
WantedBy=multi-user.target" > ${srcdir}/pteroq.service

cp ${srcdir}/${projectname}.conf ${srcdir}/${pkgname1}-${pkgver}/${projectname}.conf
}

package() {
	#https://pterodactyl.io/daemon/installing.html#installing-daemon-software
	mkdir -p ${pkgdir}/var/www/ #${pkgname}
	mkdir -p ${pkgdir}/usr/lib/systemd/system/
	mkdir -p ${pkgdir}/usr/bin
	cp -r ${srcdir}/${pkgname1}-${pkgver} ${pkgdir}/var/www/${projectname}
	cd ${pkgdir}/var/www/${projectname}
	#tar --strip-components=1 -xzvf ${srcdir}/panel.tar.gz
	chmod -R 755 ${pkgdir}/var/www/${projectname}/storage/* ${pkgdir}/var/www/${projectname}/bootstrap/cache/
	chown -R http:http *
	#cp ${pkgdir}/var/www/${projectname}/.env.example ${pkgdir}/var/www/${projectname}/.env
	install -Dm644 ${srcdir}/pteroq.service ${pkgdir}/usr/lib/systemd/system/
	install -Dm755 ${srcdir}/${pkgname}.sh  ${pkgdir}/var/www/${projectname}/${pkgname}.sh
	ln -rTsf ${pkgdir}/var/www/${projectname}/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
}
