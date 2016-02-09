# Maintainer: mawcomw <mawcomw@gmail.com>
pkgname=limesurvey
pkgver=2.5.0.160206
pkgrel=1
pkgdesc="Then open source survey application."
arch=('any')
url="http://www.limesurvey.org"
license=('GPL2')
depends=('php>=5.3')
#makedepends=()
#checkdepends=()
optdepends=('apache: a supported application server'
	    'nginx: a supported application server'
	    'tomcat6: a supported application server'
	    'tomcat7: a supported application server'
	    'mariadb: MariaDB database support'
	    'mysql: MySQL database support'
	    'postgresql: PostgreSQL database support')
provides=('limesurvey')
#conflicts=()
#replaces=()
#backup=('')
#options=()
#install=limesurvey.install
#changelog
source=('http://download.limesurvey.org/latest-stable-release/limesurvey250plus-build160206.tar.gz'
	'apache.example.conf')
#noextract
#md5sums=()
#sha1sums=()
#sha256sums=()
#sha384sums=()
sha512sums=('986b14ed6250896ad2c1d1bad296d4147ed529fd6cb3cd48a34cc40fe405054d24b18923c7b1f8e76f1aff0326c7bd8267d2c7009ba6e9ffa5be54b59516c562'
	    'e594a3a02cb04e1cca9ddf1c5995344f20adc9c5543fe622ad66fdc48d587fc969541530f1e2a8883e0f501ed1b2d409c23ecc7cd8e29aaea0369f625cd4f417')

build() {
	return 0
}

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
