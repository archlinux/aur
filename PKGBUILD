# Maintainer: Sir-Photch < sir-photch ate posteo dote me >
# PKGBUILD adapted from mautrix-telegram

pkgname=mautrix-linkedin
pkgver=0.5.4
pkgrel=1
pkgdesc="A LinkedIn Messaging Matrix Bridge"
url="https://github.com/beeper/linkedin"
depends=(
	'python' 
	'python-asyncpg' 
	'python-ruamel-yaml'
	'python-magic' 
	'python-commonmark' 
	'python-aiohttp' 
	'python-yarl'
	'python-linkedin-messaging'
	'python-mautrix>=0.20.1' 'python-mautrix<0.21'
)
makedepends=('python-setuptools' 'python-pytest-runner')
optdepends=(
	'python-pysocks: proxy'
	'python-setuptools: weblogin'
	'python-aiohttp-socks: proxy'
	'python-pillow: animated stickers'
	'python-prometheus_client: metrics upload'
	'python-olm: end-to-bridge encryption support'
	'python-unpaddedbase64: end-to-bridge encryption support'
	'python-aiosqlite: sqlite database support'
)
license=(Apache)
arch=('any')
source=(
	"${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz" 
	"${pkgname}.service" 
	"${pkgname}.sysusers" 
	"${pkgname}.tmpfiles"
)
sha256sums=('0be4713b076c99fb10bf2d857a87235b561ce98cf03eb0cf070ddcd9f7cb80b0'
            'de53ce26269b76ac35d3fc30ecebe6904f5559abc3f45a811440581f9342c2a1'
            '21da6e92a5c272eceddd301229adbd48995e140ae6ef74ebc83dbd32bee9e6cc'
            '4a66b09497c195fc299f639661ddea6f4005d08637260187cb24b8b066a0cd18')
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
