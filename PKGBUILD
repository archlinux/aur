# SPDX-License-Identifier: BSD-2-Clause
# Maintainer: Aki-nyan <aur@catgirl.link>

_pkgname="torii-boards"
pkgname="python-${_pkgname}"
pkgver=0.8.1
pkgrel=2
pkgdesc="Supplementary FPGA Board Files for Torii"
arch=("any")
url="https://github.com/shrine-maiden-heavy-industries/torii-boards"
license=("BSD-2-Clause")
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}-git" "${pkgname}-nightly")
depends=(
	"python>=3.11" "python<4.0"
	"python-torii>=${pkgver}" "python-torii<1.0"
)
makedepends=(
	"python-build"
	"python-installer"
	"python-pip"
	"python-setuptools-scm"
	"python-setuptools>=66"
	"python-wheel"
)
optdepends=(
	"dfu-util: Board Programming"
	"openfpgaloader: Board Programming"
	"openocd: Board Programming"
	"nextpnr-ice40: Lattice iCE40 FPGA support"
	"nextpnr-ecp5: Lattice ECP5/ECP5G FPGA support"
	"nextpnr-machxo2: Lattice machXO2/machXO3L FPGA support"
)
source=(
	"${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-${pkgver}.tar.gz"
)
sha256sums=(
	"272aa62bb3d77cbc977b002ff446acd981c4b4194c09f04d1edac5aa1a60bbf7"
)

build() {
	cd "${_pkgname//-/_}-${pkgver}"

	# Build the core Torii boards wheel
	SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}" python -m build --wheel --no-isolation
}

package() {
	cd "${_pkgname//-/_}-${pkgver}"

	# Install the Torii boards wheel and License
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
