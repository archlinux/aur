# Maintainer: BrainDamage
pkgname=mautrix-telegram
pkgver=0.11.0
pkgrel=1
pkgdesc="A Matrix-Telegram hybrid puppeting/relaybot bridge."
url="https://github.com/tulir/mautrix-telegram"
depends=('python' 'python-asyncpg' 'python-ruamel-yaml'
	'python-magic-ahupp' 'python-commonmark' 'python-aiohttp' 'python-yarl'
	'python-mautrix>=0.14.0' 'python-mautrix<0.15'
	'python-telethon' 'python-telethon-session-sqlalchemy')
makedepends=('python-setuptools' 'python-pytest-runner')
optdepends=('python-cryptg: faster encryption'
	'python-cchardet: faster encoding detection'
	'python-brotli: faster compression'
	'python-aiodns: asyncronous dns requests'
	'python-pillow: webp conversion and qr code login'
	'python-qrcode: qr code login'
	'python-moviepy: high quality thumbnails'
	'python-phonenumbers: formatted numbers'
	'python-prometheus_client: metrics upload'
	'python-olm: end-to-bridge encryption support'
	'python-pycryptodome: end-to-bridge encryption support'
	'python-unpaddedbase64: end-to-bridge encryption support'
	'python-aiosqlite: sqlite database support')
license=('AGPLv3')
arch=('any')
source=("${pkgname}-${pkgver}::${url}/archive/v${pkgver}.tar.gz" "${pkgname}.service" "${pkgname}.sysusers" "${pkgname}.tmpfiles")
sha256sums=('ad3e3a83e0eec0acb2a4f7af54fa7ba2ff0b89a9112fd34d7a40e02def43caad'
            '278ebd5fc931bbf87e442c774cb8e5f4d17ef8b553066531a3d66810d76a471e'
            '83dc721df0451c199d23ea74b60a065d92f98e9026dd779aca30d25195b88cf9'
            '2f5c45f6b0a9d1ae5237a91bdcb527609d262bc27cb7fa1dc736b4103ee230e5')
backup=("etc/${pkgname}/config.yaml" "etc/${pkgname}/registration.yaml")
install="${pkgname}.install"
_dirname="${pkgname#mautrix-}-${pkgver}"


prepare() {
	cd "${srcdir}/${_dirname}"
	# the author makes liberal usage of max version for requirements without a real need
	# we'll strip them and re-introduce in the deps/optdeps array if truly necessary
	# to prevent a nightmare during updates while tracking stable releases
	cp requirements.txt ../requirements.txt.orig
	cp optional-requirements.txt  ../optional-requirements.txt.orig
	sed -i -E 's/,?<[[:digit:]]*\.?[[:digit:]]+,?//g' requirements.txt
	sed -i -E 's/,?<[[:digit:]]*\.?[[:digit:]]+,?//g' optional-requirements.txt
	# create an empty registration file so that permissions get written properly from the get go
	# this way secret keys are never world readable
	touch registration.yaml
}

build() {
	cd "${srcdir}/${_dirname}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_dirname}"

	_shared_dir="/usr/share/${pkgname}"

	python setup.py install --optimize=1 --skip-build --root="${pkgdir}/" --prefix="/usr" --install-data="${_shared_dir}"

	# it's a semi-common failure for python packages to install tests in the main dir
	# which would make them conflict eachother
	rm -rf "${pkgdir}$(python -c 'import site; print(site.getsitepackages()[0])')/tests"

	# install the original requirements file, useful as documentation
	install -Dvm 644 "${srcdir}/requirements.txt.orig" "$(find ${pkgdir} -name 'requires.txt' -printf '%h')"
	install -Dvm 644 "${srcdir}/optional-requirements.txt.orig" "$(find ${pkgdir} -name 'requires.txt' -printf '%h')"

	install -Dvm 644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
	install -Dvm 644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
	install -Dvm 644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

	install -Dvm 640 "${pkgdir}${_shared_dir}/example-config.yaml" "${pkgdir}/etc/${pkgname}/config.yaml"
	install -Dvm 640 registration.yaml "${pkgdir}/etc/${pkgname}/registration.yaml"
}
