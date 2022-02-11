
pkgname=mautrix-instagram
pkgver=0.1.2
pkgrel=2
pkgdesc='A Matrix-Instagramhybrid puppeting/relaybot bridge'
arch=('any')
license=('AGPL-3.0')
depends=(python-sqlalchemy python-alembic python-ruamel-yaml python-magic python-commonmark
  python-aiohttp python-mautrix python-attrs python-paho-mqtt python-yarl
  python-asyncpg python-pycryptodome)
makedepends=('git')
optdepends=(
  'python-prometheus_client: prometheus metrics'
  'python-psycopg2: postgres'
  'python-matrix-nio: end-to-bridge encryption'
)
backup=("etc/$pkgname/config.yaml")
install=${pkgname}.install
url='https://github.com/mautrix/instagram'
license=('AGPLv3')
arch=('any')
source=("${pkgname}-${pkgver}::${url}/archive/v${pkgver}.tar.gz" "${pkgname}.service" "${pkgname}.sysusers" "${pkgname}.tmpfiles")
sha256sums=('b9e4f8ceecac32cb2375b792490a5e0e50b920dffc03a6101717293eec1af676'
            'a4cbdb090c36b0c86cf85675541dfb8e5cc33acbe85dd42162d97f580309f333'
            '7cf46059f0e5f571dd18349f90d8da1e0ffadd86951c0d75c2d837113b20489e'
            '0d6ceb4110d8e3a130e2960779cd57f9b79862a790c82ea64f989ca519ca90b0')
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
