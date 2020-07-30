# Maintainer: Krystian <krystian@krystianch.com>

pkgname=codimd-git
pkgver=r2487.dde1c742
pkgrel=2
pkgdesc="real-time collaborative markdown notes"
arch=('any')
url="https://demo.codimd.org/"
license=('AGPL3')
depends=('nodejs>=8.5' 'npm' 'node-gyp')
optdepends=('postgresql: database'
            'mariadb: database'
            'sqlite: database')
makedepends=('yarn' 'bash' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=("etc/webapps/${pkgname%-git}"/{config.json,.sequelizerc})
install="${pkgname%-git}.install"
source=("${pkgname%-git}::git+https://github.com/codimd/server.git"
        "sysusers.conf"
        "tmpfiles.conf"
        "codimd.service")
sha512sums=('SKIP'
            'fadc9f85a5ab9109d8ee92b2fc6a07a7c1f172e8fbfa42265305c36e7c07438ffe9a7be9424981678a8466679c4993fe1f67e3f119b4743abc2eebed0749c5eb'
            '100763115d51c0202a57b882761952dfd560d1c3a4bcec2be0c0cc2475fe76e643f90072f7c743f58f8996fd6bc3f9b4d0847a7462de5c64561d17b1f0465105'
            '41e809ecbf4a90ca28ab86feea131e1f5e61bdc4d64b0f4d2704320a8b295d8d6ba40150df5fdb6bafb0c68c8aa1046c929251622c7241f44f2f1b42945ca36b')


pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build()
{
	cd "${pkgname%-git}"
	bin/setup
	yarn run build
}


package()
{
	cd "${pkgname%-git}"

	# Remove build dependencies
	yarn install --production --offline --non-interactive

	cd "$srcdir"

	install -m0755 -d "${pkgdir}/usr/share/webapps"
	cp -r "${pkgname%-git}" "${pkgdir}/usr/share/webapps/${pkgname%-git}"

	# Remove that Makefile containing a reference to ${pkgdir}.
	rm "${pkgdir}/usr/share/webapps/${pkgname%-git}/node_modules/dtrace-provider/build/Makefile"

	# Make public/uploads a symlink to the codimd writable directory.
	# An alternative would be to configure the uploadsPath in config.json.
	rm "${pkgdir}/usr/share/webapps/${pkgname%-git}/public/uploads/.gitkeep"
	rm -d "${pkgdir}/usr/share/webapps/${pkgname%-git}/public/uploads"
	ln -s "/var/lib/${pkgname%-git}/uploads" \
		"${pkgdir}/usr/share/webapps/${pkgname%-git}/public/uploads"

	# Setup config files in /etc.
	install -m0755 -d "${pkgdir}/etc/webapps/${pkgname%-git}"
	mv "${pkgdir}/usr/share/webapps/${pkgname%-git}"/{config.json,.sequelizerc} \
		"${pkgdir}/etc/webapps/${pkgname%-git}/"
	ln -s "/etc/webapps/${pkgname%-git}"/{config.json,.sequelizerc} \
		"${pkgdir}/usr/share/webapps/${pkgname%-git}/"

	# Configure codimd user and some directories writable for that user.
	install -Dm0644 sysusers.conf "${pkgdir}/usr/lib/sysusers.d/${pkgname%-git}.conf"
	install -Dm0644 tmpfiles.conf "${pkgdir}/usr/lib/tmpfiles.d/${pkgname%-git}.conf"

	# Install systemd service file.
	install -Dm0644 -t "${pkgdir}/usr/lib/systemd/system/" codimd.service
}
