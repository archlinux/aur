# SPDX-License-Identifier: BSD-2-Clause
# Maintainer: Aki-nyan <aur@catgirl.link>

_pkgname="torii-usb"
pkgname="python-${_pkgname}"
pkgver=0.8.1
pkgrel=1
pkgdesc="A Torii HDL framework for USB"
arch=("any")
url="https://github.com/shrine-maiden-heavy-industries/torii-usb"
license=("BSD-3-Clause")
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}-git" "${pkgname}-nightly")
depends=(
	"python>=3.11" "python<4.0"
	"python-torii>=${pkgver}"
	"python-usb-construct>=0.2.1"
)
makedepends=(
	"python-build"
	"python-installer"
	"python-pip"
	"python-setuptools-scm"
	"python-setuptools>=66"
	"python-wheel"
)
source=(
	"${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-${pkgver}.tar.gz"
)
sha256sums=(
	"fad3a28bc95aba1eb413abd6f97b89ac55324a352a51535565905c8dbd11a720"
)

build() {
	cd "${_pkgname//-/_}-${pkgver}"

	# Build the core usb-construct wheel
	SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}" python -m build --wheel --no-isolation
}

package() {
	cd "${_pkgname//-/_}-${pkgver}"

	# Install the core usb-construct wheel and License
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

check() {
	cd "${_pkgname//-/_}-${pkgver}"

	# Run tests
	python -m venv  --clear --system-site-packages torii-usb-test-env
	torii-usb-test-env/bin/python -m installer dist/*.whl
	torii-usb-test-env/bin/python -P -m unittest discover -v
}
