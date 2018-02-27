# LimeSurvey 2.x

_name=limesurvey
pkgname=limesurvey2
_version='2.73.1-build171220'
pkgver="${_version/-/.}"
pkgrel=1
pkgdesc='The open source survey application'
arch=('any')
url='http://www.limesurvey.org'
license=('GPL2')
provides=('limesurvey')
conflicts=('limesurvey')
depends=('php>=5.3')
optdepends=('apache: a supported application server'
	    'nginx: a supported application server'
	    'tomcat6: a supported application server'
	    'tomcat7: a supported application server'
	    'mariadb: MariaDB database support'
	    'mysql: MySQL database support'
	    'postgresql: PostgreSQL database support')
source=("http://download.limesurvey.org/archived-releases/limesurvey${_version}.zip"
	'apache.example.conf')
sha256sums=('8ce7c05304b1d192aa4cfef8af1cdf38338b96c64f5fb50c671e17f2826436fb'
            '325eefd06cd8e9502b90ff13739f9f3a2d405ab30728c109de202847086357c5')

package() {
	_limesurvey_installation_path="/usr/share/webapps"
	_limesurvey_conf_path="/etc/webapps"
	
	_instdir="${pkgdir}/${_limesurvey_installation_path}"
	_conf_dir="${pkgdir}/${_limesurvey_conf_path}"
	
	#install license
	install -Dm644 "${srcdir}/${_name}/docs/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"

	# install core application in /usr/share/webapps
	mkdir -p ${_instdir}
	cp -ra "${srcdir}/${_name}" ${_instdir}
	
	# install configuration files in /etc/webapps
	mkdir -p "${_conf_dir}/${_name}"
	# limesurvey does not work with separate paths, and
	# for now i will not fix this.
	#mv "${_instdir}/${_name}/application/config" "${_conf_dir}/${_name}/config"
	#ln -s "/etc/webapps/${_name}/config" "${_instdir}/${_name}/application/config"
	
	# set the group that will run the http server to have write permission (for apache it should be http)
	chgrp -R http "${_instdir}/${_name}/tmp"
	chmod -R 775 "${_instdir}/${_name}/tmp"
	chgrp -R http "${_instdir}/${_name}/upload"
	chmod -R 775 "${_instdir}/${_name}/upload"

	chgrp -R http "${_instdir}/${_name}/application/config"
	chmod -R 775 "${_instdir}/${_name}/application/config"
	
	# install apache example config file
	install -m 644 ${srcdir}/apache.example.conf ${pkgdir}/etc/webapps/${_name}
}
