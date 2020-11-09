# Maintainer: BrainDamage
pkgname=mautrix-telegram
pkgver=0.8.2
pkgrel=5
pkgdesc="A Matrix-Telegram hybrid puppeting/relaybot bridge."
url="https://github.com/tulir/mautrix-telegram"
depends=('python' 'python-sqlalchemy' 'python-alembic' 'python-ruamel-yaml'
	'python-magic-ahupp' 'python-commonmark' 'python-aiohttp' 'python-yarl'
	'python-mautrix<0.6' 'python-telethon' 'python-telethon-session-sqlalchemy')
makedepends=('python-setuptools')
optdepends=('python-cryptg: Faster encryption'
	'python-cchardet: faster encoding detection'
	'python-aiodns: asyncronous dns requests'
	'python-pillow: webp conversion and qr code login'
	'python-qrcode: qr code login'
	'python-moviepy: high quality thumbnails'
	'python-prometheus_client: metrics upload'
	'python-psycopg2: postgresql database support'
	'python-matrix-nio: end-to-bridge encryption support')
license=('AGPLv3')
arch=('any')
source=("${url}/archive/v${pkgver}.tar.gz" "${pkgname}.service" "${pkgname}.sysusers" "${pkgname}.tmpfiles")
sha256sums=('1f227f50e84f643fc7633f1a8f336aa1e51db6c12628e983783c2995a41d497f'
	'7d947a08bff4bf172346682d68af6071e5df556d16065b439aa312edc57e5e84'
	'fce0a4f792e62d9440fe431fb6ab6c458139bcc801bc2b02bc1b3d8f2ff9fcbf'
	'e6d4565350477d180c639cc1e0805d475ef036e870db671b22374e9c91f95c7c')
backup=("etc/${pkgname}/config.yaml")


prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	# the author makes liberal usage of max version for requirements without a real need
	# we'll strip them and re-introduce in the deps/optdeps array if truly necessary
	# to prevent a nightmare during updates while tracking stable releases
	sed -i -E 's/,?<[[:digit:]]*\.?[[:digit:]]+,?//g' requirements.txt
	sed -i -E 's/,?<[[:digit:]]*\.?[[:digit:]]+,?//g' optional-requirements.txt
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

	# TODO: remove this when ver 9 gets out of rc since it installs the example config to the data dir properly
	mv "${pkgdir}$(python -c 'import site; print(site.getsitepackages()[0])')/${pkgname//-/_}/example-config.yaml" "${pkgdir}${_shared_dir}"

	# adjust alembic script dir location so that by using an abs path it can be used in CWD
	sed -i -e "s|script_location = alembic|script_location = ${_shared_dir}/alembic/|" "${pkgdir}${_shared_dir}/alembic.ini"

	install -Dvm 644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
	install -Dvm 644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
	install -Dvm 644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

	install -Dvm 640 "${pkgdir}${_shared_dir}/example-config.yaml" "${pkgdir}/etc/${pkgname}/config.yaml"
}

post_install() {
	cat <<- EOF
	after editing /etc/${pkgname}/config.yaml, generate a registration file using
	# ${pkgname} -b /etc/${pkgname}/config.yaml -c /usr/share/${pkgname}/example-config.yaml -r /etc/${pkgname}registration.yaml -g
	then update the permissions/ownership using
	$ systemd-tmpfiles --create --prefix /etc/${pkgname}
	EOF
}