# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>

pkgname=codimd
pkgver=1.6.0
pkgrel=2
pkgdesc="real-time collaborative markdown notes"
arch=('any')
url="https://demo.codimd.org/"
license=('AGPL3')
depends=('nodejs>=8.5' 'npm' 'node-gyp')
optdepends=('postgresql: database'
            'mariadb: database'
						'sqlite: database')
makedepends=('yarn' 'bash')
backup=("etc/${pkgname}/config.json" "etc/${pkgname}/.sequelizerc")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/codimd/server/archive/${pkgver}.tar.gz"
        "sysusers.conf"
        "tmpfiles.conf"
        "codimd.service")
sha512sums=('50ebf76c365e821c8aec675a975000bf920b44bed939493ea0956ec621aa80ae33a3664654f7d01437f4f5864a73028a635fc11753c229808863c519c5a39998'
            'fadc9f85a5ab9109d8ee92b2fc6a07a7c1f172e8fbfa42265305c36e7c07438ffe9a7be9424981678a8466679c4993fe1f67e3f119b4743abc2eebed0749c5eb'
            '100763115d51c0202a57b882761952dfd560d1c3a4bcec2be0c0cc2475fe76e643f90072f7c743f58f8996fd6bc3f9b4d0847a7462de5c64561d17b1f0465105'
            '7ac84a44b1128f17252a0f537f00ed87005b815cdeadc7367bb5797c375762d850fc69f0b6ef633e9e4937a138f00209fa987980ae795da92023ee84fa6ff60a')


build()
{
	cd "server-${pkgver}"
	bin/setup
	yarn run build
}


package()
{
	cd "server-${pkgver}"

	# Remove build dependencies
	yarn install --production

	cd "$srcdir"

	install -m0755 -d "${pkgdir}/usr/share/webapps"
	cp -r "server-${pkgver}" "${pkgdir}/usr/share/webapps/${pkgname}"

	# Remove that Makefile containing a reference to ${pkgdir}.
	rm "${pkgdir}/usr/share/webapps/${pkgname}/node_modules/dtrace-provider/build/Makefile"

	# Make public/uploads a symlink to the codimd writable directory.
	# An alternative would be to configure the uploadsPath in config.json.
	rm "${pkgdir}/usr/share/webapps/${pkgname}/public/uploads/.gitkeep"
	rm -d "${pkgdir}/usr/share/webapps/${pkgname}/public/uploads"
	ln -s "/var/lib/${pkgname}/uploads" \
		"${pkgdir}/usr/share/webapps/${pkgname}/public/uploads"

	# Setup config files in /etc.
	install -m0755 -d "${pkgdir}/etc/${pkgname}"
	mv "${pkgdir}/usr/share/webapps/${pkgname}"/{config.json,.sequelizerc} \
		"${pkgdir}/etc/${pkgname}/"
	ln -s "/etc/${pkgname}"/{config.json,.sequelizerc} \
		"${pkgdir}/usr/share/webapps/${pkgname}/"

	# Configure codimd user and some directories writable for that user.
	install -Dm0644 sysusers.conf "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
	install -Dm0644 tmpfiles.conf "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

	# Install systemd service file.
	install -Dm0644 -t "${pkgdir}/usr/lib/systemd/system/" codimd.service
}
