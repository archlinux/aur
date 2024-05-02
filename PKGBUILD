# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Marcin Kornat <rarvolt@gmail.com>
pkgname=labelle
pkgver=1.2.2
pkgrel=1
pkgdesc="Linux Software to print with LabelManager PnP from Dymo"
arch=('any')
license=('Apache-2.0')
replaces=('dymoprint')
url="https://github.com/labelle-org/labelle"
depends=(
    'python'
    'python-barcode'
    'python-darkdetect'
    'python-pillow'
    'python-platformdirs'
    'python-pyqrcode'
    'python-pyqt6'
    'python-pyusb'
    'python-rich'
    'python-typer'
)
makedepends=(
    'git'
    'python-build'
    'python-hatch-vcs'
    'python-hatchling'
    'python-installer'
    'python-pip'
    'python-setuptools'
    'python-setuptools-scm'
    'python-wheel'
)
source=(
        "${pkgname}-${pkgver}.tar.gz::https://github.com/labelle-org/labelle/archive/${pkgver}.tar.gz"
        "91-dymo-labelmanager-pnp.rules"
        "dymo-labelmanager-pnp.conf"
)
sha512sums=('a9c47a0caec8a5884364f7616ce0032e0c183bdffe3355ce998d8d07d0eda52562e6afa3d528a138538cb56b821c66b787a8d2fe399e79fce4d937a5a3256e9f'
            '76c4d8b9b9abd6c9100b6d0032af0d3752fbb7827f2d3a8417b28d2b822b9f7956051163de015a26e0fa6c548851a0f73e74bea37d1c1583cc457a9dc6be6b68'
            'a73a5cd46e020d9d43d18cf52927085f055b9d3e77d5ed98f254e3fff07b053aff1125e931b2fd984f08dcb501d344544dc2de58adb66270455b4f482bc8f3f1')

prepare() {
    cd "${pkgname}-${pkgver}"
    # Unpin dependency range
    sed -i -E -e 's/"(hatchling|hatch-vcs) [^"]+"/"\1"/g' pyproject.toml
}

build() {
    cd "${pkgname}-${pkgver}"
    export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    install -Dm644 91-dymo-labelmanager-pnp.rules "${pkgdir}/etc/udev/rules.d/91-dymo-labelmanager-pnp.rules"
    install -Dm644 dymo-labelmanager-pnp.conf "${pkgdir}/etc/usb_modeswitch.d/dymo-labelmanager-pnp.conf"

    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
