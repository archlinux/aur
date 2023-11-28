# Maintainer: BrainDamage
pkgname=mautrix-telegram
pkgver=0.15.0
pkgrel=1
pkgdesc="A Matrix-Telegram hybrid puppeting/relaybot bridge."
url="https://github.com/tulir/mautrix-telegram"
# python-tulir-telethon needs exact version matching
# as long as I maintain both I can just keep the updates in sync myself
# if someone else were to maintain only one, it'd need explicit version pin
depends=('python' 'python-asyncpg' 'python-ruamel-yaml'
	'python-magic' 'python-commonmark' 'python-aiohttp' 'python-yarl'
	'python-mautrix>=0.20.3' 'python-mautrix<0.21'
	'python-tulir-telethon'
	'python-mako')
makedepends=('python-setuptools' 'python-pytest-runner')
optdepends=('ffmpeg: high quality thumbnails'
	'python-cryptg: faster encryption'
	'python-cchardet: faster encoding detection'
	'python-brotli: faster compression'
	'python-aiodns: asyncronous dns requests'
	'python-pillow: webp conversion and qr code login'
	'python-qrcode: qr code login'
	'python-phonenumbers: formatted numbers'
	'python-prometheus_client: metrics upload'
	'python-olm: end-to-bridge encryption support'
	'python-pycryptodome: end-to-bridge encryption support'
	'python-unpaddedbase64: end-to-bridge encryption support'
	'python-aiosqlite: sqlite database support')
license=('AGPLv3')
arch=('any')
source=("${pkgname}-${pkgver}::${url}/archive/v${pkgver}.tar.gz" "${pkgname}.service" "${pkgname}.sysusers" "${pkgname}.tmpfiles")
sha256sums=('93060a58be005f441402e569d9ba3ad84bdc51e551a2e2d40b5e7e2b01f2413e'
            '7293f642e143655595088baacf0a4a3a19f869e48762f4985d1ccea039ba284b'
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
