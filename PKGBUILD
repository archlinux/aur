# SPDX-License-Identifier: BSD-2-Clause
# Maintainer: Aki-nyan <aur@catgirl.link>

_pkgname="usb-construct"
pkgname="python-${_pkgname}"
pkgver=0.2.1
pkgrel=1
pkgdesc="A Python library providing utilities, data structures, constants, parsers, and tools for working with USB data"
arch=("any")
url="https://github.com/shrine-maiden-heavy-industries/usb-construct"
license=("BSD-3-Clause")
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}-git" "${pkgname}-nightly")
depends=(
	"python>=3.11" "python<4.0"
	"python-construct"
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
	"b90d62daf6bbf070936029267e7c26d2ce11e88c546baeb0da4ce02bdcb2684b"
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
	python -m venv  --clear --system-site-packages usb-construct-test-env
	usb-construct-test-env/bin/python -m installer dist/*.whl
	usb-construct-test-env/bin/python -P -m unittest discover -v
}
