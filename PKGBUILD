# Maintainer: BrainDamage
pkgname=mautrix-telegram
pkgver=0.9.0
pkgrel=4
pkgdesc="A Matrix-Telegram hybrid puppeting/relaybot bridge."
url="https://github.com/tulir/mautrix-telegram"
depends=('python' 'python-sqlalchemy' 'python-alembic' 'python-ruamel-yaml'
	'python-magic' 'python-commonmark' 'python-aiohttp' 'python-yarl'
	'python-mautrix>=0.8.3' 'python-telethon<1.18' 'python-telethon-session-sqlalchemy')
makedepends=('python-setuptools')
optdepends=('python-cryptg: faster encryption'
	'python-cchardet: faster encoding detection'
	'python-brotlipy: faster compression'
	'python-aiodns: asyncronous dns requests'
	'python-pillow: webp conversion and qr code login'
	'python-qrcode: qr code login'
	'python-moviepy: high quality thumbnails'
	'python-prometheus_client: metrics upload'
	'python-psycopg2: postgresql database support'
	'python-asyncpg: end-to-bridge encryption support'
	'python-olm: end-to-bridge encryption support'
	'python-pycryptodome: end-to-bridge encryption support'
	'python-unpaddedbase64: end-to-bridge encryption support')
license=('AGPLv3')
arch=('any')
source=("${url}/archive/v${pkgver}.tar.gz" "${pkgname}.service" "${pkgname}.sysusers" "${pkgname}.tmpfiles")
sha256sums=('e0fb30bf448f1bec6f27f73662c1dcddd36986367dcbe4f34509b23af67142a9'
            'a419168bff80e469f2f4e26279afae77d92e6ae86c2457696e1ca9fc6ba1cb12'
            'fce0a4f792e62d9440fe431fb6ab6c458139bcc801bc2b02bc1b3d8f2ff9fcbf'
            'e6d4565350477d180c639cc1e0805d475ef036e870db671b22374e9c91f95c7c')
backup=("etc/${pkgname}/config.yaml" "etc/${pkgname}/registration.yaml")
install="${pkgname}.install"


prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	# the author makes liberal usage of max version for requirements without a real need
	# we'll strip them and re-introduce in the deps/optdeps array if truly necessary
	# to prevent a nightmare during updates while tracking stable releases
	sed -i -E 's/,?<[[:digit:]]*\.?[[:digit:]]+,?//g' requirements.txt
	sed -i -E 's/,?<[[:digit:]]*\.?[[:digit:]]+,?//g' optional-requirements.txt
	# create an empty registration file so that permissions get written properly from the get go
	# this way secret keys are never world readable
	touch registration.yaml
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	_shared_dir="/usr/share/${pkgname}"

	python setup.py install --optimize=1 --skip-build --root="${pkgdir}/" --prefix="/usr" --install-data="${_shared_dir}"

	# it's a semi-common failure for python packages to install tests in the main dir
	# which would make them conflict eachother
	rm -rf "${pkgdir}$(python -c 'import site; print(site.getsitepackages()[0])')/tests"

	# adjust alembic script dir location so that by using an abs path it can be used in CWD
	sed -i -e "s|script_location = alembic|script_location = ${_shared_dir}/alembic/|" "${pkgdir}${_shared_dir}/alembic.ini"

	install -Dvm 644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
	install -Dvm 644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
	install -Dvm 644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

	install -Dvm 640 "${pkgdir}${_shared_dir}/example-config.yaml" "${pkgdir}/etc/${pkgname}/config.yaml"
	install -Dvm 640 registration.yaml "${pkgdir}/etc/${pkgname}/registration.yaml"
}
