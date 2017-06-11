# Maintainer: Khalid Eldehairy <khalid # kdehairy / com>
_pacparser_pkgver=1.3.7
_txdbus_pkgver=1.0.14
_systemd_pkgver=0.9.5
_service_identity_pkgver=17.0.0

pkgname=pac4cli-git
pkgver=0.1
pkgrel=1
pkgdesc="Proxy-auto-discovery for command line applications"
arch=('i686' 'x86_64')
url="https://github.com/tkluck/pac4cli"
license=('GPL3')
depends=('python>=3.6' 'python-twisted' 'python-pyopenssl' 'libsystemd' 'networkmanager' 'python-pyopenssl' 
		'python-pyasn1' 'python-pyasn1-modules' 'python-attrs')
makedepends=('git' 'python-pyasn1' 'python-pyasn1-modules' 'python-attrs' 'python-idna')
provides=('python-pacparser')
install=${pkgname%-git}.install
source=("${pkgname%-git}::git+https://github.com/tkluck/pac4cli.git"
		"https://github.com/pacparser/pacparser/archive/${_pacparser_pkgver}.tar.gz"
		"https://github.com/cocagne/txdbus/archive/${_txdbus_pkgver}.tar.gz"
		"https://files.pythonhosted.org/packages/source/s/systemd/systemd-${_systemd_pkgver}.tar.gz"
		"https://files.pythonhosted.org/packages/source/s/service_identity/service_identity-${_service_identity_pkgver}.tar.gz")
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	LATEST_TAG=$(git describe --tags --abbrev=0 --match 'v*' 2>/dev/null)
	printf "%s" "${LATEST_TAG#*v}"
}

build() {
	#builds pacparser
	cd "${srcdir}/pacparser-${_pacparser_pkgver}"
	PYTHON=python3 make all pymod -C src

	#service_identity
	cd "${srcdir}/service_identity-${_service_identity_pkgver}"
	python3 setup.py build
}

package() {
	#package pacparser
	cd "${srcdir}/pacparser-${_pacparser_pkgver}"
	PYTHON=python3 make DESTDIR="${pkgdir}" -C src install-pymod

	#txdbus
	cd "${srcdir}/txdbus-${_txdbus_pkgver}"
	python3 setup.py install --root="${pkgdir}/" --prefix=/usr --optimize=1

	#systemd
	cd "${srcdir}/systemd-${_systemd_pkgver}"
	python3 setup.py install --root="${pkgdir}/" --prefix=/usr --optimize=1

	#service_identity
	cd "${srcdir}/service_identity-${_service_identity_pkgver}"
	python3 setup.py install --root="${pkgdir}/" --prefix=/usr --optimize=1 --skip-build

	#package pac4cli
	cd "${srcdir}/${pkgname%-git}"
	LATEST_TAG=$(git describe --tags --abbrev=0 --match 'v*' 2>/dev/null)	# get latest release tag
	if [[ "x${LATEST_TAG}" == "x" ]]; then
		echo "Could not find any releases to build."
		exit 1;
	fi
	git checkout ${LATEST_TAG}										# checkout latest release tag
	PYTHON=python3 make pythonsitedir=/usr/lib/python3.6/site-packages DESTDIR="${pkgdir}" prefix=/usr install
}
