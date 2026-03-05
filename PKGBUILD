# SPDX-License-Identifier: BSD-2-Clause
# Maintainer: Aki-nyan <aur@catgirl.link>

_pkgname="torii"
pkgname="python-${_pkgname}"
pkgver=0.8.1
pkgrel=2
pkgdesc="A Python-based HDL and framework for silicon-based witchcraft"
arch=("any")
url="https://github.com/shrine-maiden-heavy-industries/torii-hdl"
license=("BSD-2-Clause")
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}-git" "${pkgname}-nightly")
depends=(
	"python>=3.10" "python<4.0"
	"python-jinja>=1:3.1" "python-jinja<1:4.0"
	"python-platformdirs>=4.0" "python-platformdirs<5.0"
	"python-pyvcd>=0.4.0" "python-pyvcd<0.5.0"
	"python-rich>=13.7.0"
	"python-setuptools>=66"
	"yosys"
)
makedepends=(
	"python-build"
	"python-installer"
	"python-setuptools-scm"
	"python-setuptools>=66"
	"python-wheel"
)
checkdpends=(
	"yices" "sby"
)
optdepends=(
	"gtkwave: Simulation trace viewing"
	"surfer-waveform: Simulation trace viewing"
	"sby: Formal Verification support"
	"yices: Formal Verification support"
	"nextpnr-ice40: Lattice iCE40 FPGA support"
	"nextpnr-ecp5: Lattice ECP5/ECP5G FPGA support"
	"nextpnr-machxo2: Lattice machXO2/machXO3L FPGA support"
)
source=(
	"${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-${pkgver}.tar.gz"
)
sha256sums=(
	"d56cc7fb15126692a34899c5d9b6300db8e72db2c5306f8883ce40177c099763"
)

build() {
	cd "${_pkgname}-${pkgver}"

	# Build the core Torii wheel
	SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}" python -m build --wheel --no-isolation
}

package() {
	cd "${_pkgname}-${pkgver}"

	# Install the Torii wheel and License
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
	cd "${_pkgname}-${pkgver}"

	# Run tests
	python -m venv  --clear --system-site-packages torii-test-env
	torii-test-env/bin/python -m installer dist/*.whl
	torii-test-env/bin/python -P -m unittest discover -v
}
