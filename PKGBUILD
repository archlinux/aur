# Maintainer: mawcomw <mawcomw@gmail.com>

pkgname=limesurvey
pkgver=3.4.2+180223
pkgrel=1
pkgdesc='The open source survey application'
arch=('any')
url='http://www.limesurvey.org'
license=('GPL2')
depends=('php>=5.3')
optdepends=('apache: a supported application server'
	    'nginx: a supported application server'
	    'tomcat6: a supported application server'
	    'tomcat7: a supported application server'
	    'mariadb: MariaDB database support'
	    'mysql: MySQL database support'
	    'postgresql: PostgreSQL database support')
source=("http://download.limesurvey.org/latest-stable-release/${pkgname}${pkgver}.tar.bz2"
	'apache.example.conf')
sha256sums=('9736bce66d6016672c73fad2956ff27dea62f23f24a4a8e5ece85c625cc6351d'
            '325eefd06cd8e9502b90ff13739f9f3a2d405ab30728c109de202847086357c5')

package() {
	_limesurvey_installation_path="/usr/share/webapps"
	_limesurvey_conf_path="/etc/webapps"
	
	_instdir="$pkgdir/${_limesurvey_installation_path}"
	_conf_dir="$pkgdir/${_limesurvey_conf_path}"
	
	#install license
	install -Dm644 "${srcdir}/${pkgname}/docs/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"

	# install core application in /usr/share/webapps
	mkdir -p ${_instdir}
	cp -ra "${srcdir}/${pkgname}" ${_instdir}
	
	# install configuration files in /etc/webapps
	mkdir -p "${_conf_dir}/${pkgname}"
	# limesurvey does not work with separate paths, and
	# for now i will not fix this.
	#mv "${_instdir}/${pkgname}/application/config" "${_conf_dir}/${pkgname}/config"
	#ln -s "/etc/webapps/${pkgname}/config" "${_instdir}/${pkgname}/application/config"
	
	# set the group that will run the http server to have write permission (for apache it should be http)
	chgrp -R http "${_instdir}/${pkgname}/tmp"
	chmod -R 775 "${_instdir}/${pkgname}/tmp"
	chgrp -R http "${_instdir}/${pkgname}/upload"
	chmod -R 775 "${_instdir}/${pkgname}/upload"

	chgrp -R http "${_instdir}/${pkgname}/application/config"
	chmod -R 775 "${_instdir}/${pkgname}/application/config"
	
	# install apache example config file
	install -m 644 ${srcdir}/apache.example.conf ${pkgdir}/etc/webapps/${pkgname}
}
