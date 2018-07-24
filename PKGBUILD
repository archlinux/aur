# Maintainer: Sandro Rüegge <sandro.rueegge@gmail.com>
pkgname=self-service-password
pkgver=1.3
pkgrel=12
pkgdesc="A small webinterface for changing/resetting ldap passwords"
arch=('any')
url="https://ltb-project.org/documentation/self-service-password"
license=('GPL3')
depends=('php>=5'
         'php-ldap')
optdepends=(
	'php-mcrypt: For token resets'
)
backup=("etc/webapps/$pkgname/config.php")
source=("https://ltb-project.org/archives/ltb-project-$pkgname-$pkgver.tar.gz"
	'config.php'
	'apache.example.conf')
sha512sums=('71aec5a3673ee710d4ba4a17862c695e0775ad944d85c8e05e826774010b8e905af5ab9e75886bc8c2efb9d9372ffe00d8856024e9656e1c71a57017b0eeac6d'
            '8b672a77c9b269e4885a345bb1daeaa090f334f6391f691290e4e39157b30164f9248181c93865cdeabbf5e0537907168dae672abbbe28b65dd188e7fdb29000'
            '9717929d6e7197a5c64cc56a8c89d5e2b7663083135d037ac4e60499f1434317018cc57f50e149dc79911e8257e9b03f538b4c06d63e416011c777438594b65f')

package() {
	# install the project
	install -d ${pkgdir}/usr/share/webapps/${pkgname}
	cp -r ${srcdir}/ltb-project-${pkgname}-${pkgver}/* ${pkgdir}/usr/share/webapps/${pkgname}
	# set the correct permission
	chown -R root:root ${pkgdir}/usr/share/webapps/${pkgname}
	find ${pkgdir}/usr/share/webapps/${pkgname} -type f -exec chmod 0644 {} \;
	find ${pkgdir}/usr/share/webapps/${pkgname} -type d -exec chmod 0755 {} \;

	# install the configuration
	install -d ${pkgdir}/etc/webapps/${pkgname}
	install -m 640 -o http -g http ${srcdir}/config.php ${pkgdir}/etc/webapps/${pkgname}
	install -m 644 -o root -g root ${srcdir}/apache.example.conf ${pkgdir}/etc/webapps/${pkgname}
	ln -sf /etc/webapps/${pkgname}/config.php ${pkgdir}/usr/share/webapps/${pkgname}/conf/config.inc.local.php
}
