# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Marcin Kornat <rarvolt@gmail.com>
pkgname=labelle
pkgver=1.3.2
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
    'python-hatch-fancy-pypi-readme'
    'python-hatch-vcs'
    'python-hatchling'
    'python-installer'
    'python-pip'
    'python-setuptools'
    'python-setuptools-scm'
)
checkdepends=(
    'at-spi2-core'
    'python-pytest'
    'python-pytest-image-diff'
    'python-pytest-qt'
    'xorg-server-xvfb'
)
source=(
        "${pkgname}-${pkgver}.tar.gz::https://github.com/labelle-org/labelle/archive/v${pkgver}.tar.gz"
        "91-dymo-labelmanager-pnp.rules"
        "dymo-labelmanager-pnp.conf"
)
sha512sums=('fd5bcc6f054817f9780eb7f40b71ea883f1f4d652131f6a769fc7dff633b7ce15fca4d70e9016bc20ae066ebab2340ebe592cc38646f4fc4ae4ba8ed7a6bbe3d'
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

check() {
    cd "${pkgname}-${pkgver}"
    local _site_packages
    _site_packages="$(python -c 'import site; print(site.getsitepackages()[0])')"
    python -m installer --destdir=tmp_install dist/*.whl

    echo >&2 'Running unit tests'
    PYTHONPATH="${PWD}/tmp_install/${_site_packages}" \
        dbus-run-session xvfb-run -s '-nolisten local' \
        pytest src
}

package() {
    install -Dm644 91-dymo-labelmanager-pnp.rules "${pkgdir}/etc/udev/rules.d/91-dymo-labelmanager-pnp.rules"
    install -Dm644 dymo-labelmanager-pnp.conf "${pkgdir}/etc/usb_modeswitch.d/dymo-labelmanager-pnp.conf"

    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
