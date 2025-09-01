# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: Bjoern Franke <bjo+aur@schafweide.org>

pkgname=heisenbridge
pkgver=1.15.3
pkgrel=1
pkgdesc="a bouncer-style Matrix IRC bridge"
url="https://github.com/hifi/heisenbridge"
depends=('python'
	'python-aiohttp-socks'
	'python-async-timeout'
	'python-irc'
	'python-mautrix'
	'python-ruamel-yaml')
makedepends=('python-setuptools' 'python-pytest-runner')
license=('MIT')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz" "${pkgname}.service" "${pkgname}.sysusers" "${pkgname}.tmpfiles")
sha256sums=('8c0c297cf30b34b65b28932bcb7b3d04d7b001f71684784561be6b8c10543d0d'
            '67487b221bff329952f5c95186c4ea794c7e7a3e25e6d213075fd306c68cfa95'
            'b3bc4328ead7afd186d5a191fabc347543c0fad17dc01047a4cf0532d999f255'
            '24bd23e4427aaf635a91b170c07abe8a6b1c62cbad47e50a161c12807641d351')
backup=("etc/${pkgname}/registration.yaml")
install="${pkgname}.install"
_dirname="${pkgname}-${pkgver}"

prepare() {
	cd "${srcdir}/${_dirname}"
	# create an empty registration file so that permissions get written
	# properly from the get go. this way secret keys are never world
	# readable
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

	# it's a semi-common failure for python packages to install tests in
	# the main dir which would make them conflict eachother
	rm -rf "${pkgdir}$(python -c 'import site; print(site.getsitepackages()[0])')/tests"

	install -Dvm 644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
	install -Dvm 644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
	install -Dvm 644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

	install -Dvm 640 registration.yaml "${pkgdir}/etc/${pkgname}/registration.yaml"
}
