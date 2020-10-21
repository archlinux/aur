# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Timothée Ravier <tim@siosm.fr>

pkgname=mozilla-firefox-sync-server
pkgver=1.9.1
pkgrel=1
pkgdesc='Mozilla Sync Server for built-in Firefox Sync'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://mozilla-services.readthedocs.io/en/latest/howtos/run-sync-1.5.html'
license=('MPL2')
depends=('python2' 'python2-virtualenv')
options=(!debug)
install="${pkgname}.install"
source=("https://github.com/mozilla-services/syncserver/archive/${pkgver}.tar.gz"
	'ffsync.service'
	'ffsync.tmpfiles')
sha256sums=('dd12e7b4d97052ab5227151886a92ecbc368a987c4ad5fef7a9b759197a86c1f'
	'8664ad8361d6751aad47e86900270d2efd8b65d520248cd1c164432baba42212'
	'462bfdccc672339a03622dbe0a76a2df1b4293de8b240e82fe127a6befaa1a89')
sha384sums=('8dfe5784a013c4b8af16bc9af4b1c1c7d36261c62d16e6b5afb986b473195e051f8b1d392db96c562c06095da0596c6f'
	'a7384b5b55b2377ee4445e45bfd0545435c2a6a19730ff4219340e3c6e8a3b51fcb46e4215093df860f9fa99a0b471ab'
	'236b285f7e390d31cd13a0ac78c524acfbc8a7325d7b0b114b39f69a5963535d5f1f73bdef575728b2f6e81860c4ea16')
backup=('opt/mozilla-firefox-sync-server/syncserver.ini')
optdepends=('uwsgi-plugin-python2: Serve the webapp using uwsgi'
	'mozilla-firefox-account-server: Run your own firefox account server')

prepare() {
	cd "syncserver-${pkgver}"

	# Change default sqlite database location
	sed -i "s|/tmp/syncserver.db|/var/lib/ffsync/sync_storage.db|g" syncserver.ini
	sed -i "0,/^\#sqluri/s//sqluri/" syncserver.ini

	# Remove obsolete parameter
	sed -i "s| --no-site-packages||g" Makefile
}

build() {
	cd "syncserver-${pkgver}"
	make build

	# MySQL support (should already be included)
	#local/bin/pip install PyMySQL

	# PostgreSQL support
	#local/bin/pip install psycopg2

	# There is no install target in the Makefile, so let's do some cleaning
	rm -rf .git .gitignore Dockerfile Makefile MANIFEST.in README.rst setup.py \
		local/bin/pep8 local/bin/build* local/bin/easy_install* local/bin/pip* \
		local/COMPLETE

	# Remove compiled python files as they may cause issues
	find . -name '*.pyc' -delete

	# Manually fix install path
	find . -type f -exec sed -i "s|${srcdir}/syncserver-${pkgver}|/opt/${pkgname}|g" {} \;
}

check() {
	cd "syncserver-${pkgver}"

	#make test
}

package() {
	cd "syncserver-${pkgver}"

	# There is no install target in the Makefile, installing manually
	install -dm 755 "${pkgdir}"/opt/${pkgname} "${pkgdir}"/var/lib/ffsync
	cp -a * "${pkgdir}"/opt/${pkgname}

	# Manually fix permissions
	cd "${pkgdir}"/opt/${pkgname}
	find . -exec chmod go-w {} \;
	find . -type f -exec chmod a+r {} \;

	install -Dm 644 "${srcdir}"/ffsync.service "${pkgdir}"/usr/lib/systemd/system/ffsync.service
	install -Dm 644 "${srcdir}"/ffsync.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/ffsync.conf
}
