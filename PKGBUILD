# Maintainer: Sir-Photch < sir-photch ate posteo dote me >
# PKGBUILD adapted from mautrix-telegram

pkgname=mautrix-linkedin-git
_pkgname=mautrix-linkedin
pkgver=0.5.4.r94.g169f1ab
pkgrel=2
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
	'python-mautrix'
	'python-beautifulsoup4'
	'python-dataclasses-json'
	'python-pycryptodome'
)
makedepends=(
	'git'
	'python-setuptools' 
	'python-pytest-runner'
)
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
provides=('mautrix-linkedin')
license=(APLv2)
arch=('any')
_dirname="${_pkgname#mautrix-}"
source=(
	"${_dirname}::git+${url}.git" 
	"${_pkgname}.service" 
	"${_pkgname}.sysusers" 
	"${_pkgname}.tmpfiles"
)
sha256sums=('SKIP'
            'de53ce26269b76ac35d3fc30ecebe6904f5559abc3f45a811440581f9342c2a1'
            '21da6e92a5c272eceddd301229adbd48995e140ae6ef74ebc83dbd32bee9e6cc'
            '4a66b09497c195fc299f639661ddea6f4005d08637260187cb24b8b066a0cd18')
backup=("etc/${_pkgname}/config.yaml" "etc/${_pkgname}/registration.yaml")
install="${_pkgname}.install"

pkgver() {
	cd "${srcdir}/${_dirname}"
	git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

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

	_shared_dir="/usr/share/${_pkgname}"

	python setup.py install --optimize=1 --skip-build --root="${pkgdir}/" --prefix="/usr" --install-data="${_shared_dir}"

	# it's a semi-common failure for python packages to install tests in the main dir
	# which would make them conflict eachother
	rm -rf "${pkgdir}$(python -c 'import site; print(site.getsitepackages()[0])')/tests"

	# install the original requirements file, useful as documentation
	install -Dvm 644 "${srcdir}/requirements.txt.orig" "$(find ${pkgdir} -name 'requires.txt' -printf '%h')"
	install -Dvm 644 "${srcdir}/optional-requirements.txt.orig" "$(find ${pkgdir} -name 'requires.txt' -printf '%h')"

	install -Dvm 644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
	install -Dvm 644 "${srcdir}/${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
	install -Dvm 644 "${srcdir}/${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"

	install -Dvm 640 "${pkgdir}${_shared_dir}/example-config.yaml" "${pkgdir}/etc/${_pkgname}/config.yaml"
	install -Dvm 640 registration.yaml "${pkgdir}/etc/${_pkgname}/registration.yaml"
}
