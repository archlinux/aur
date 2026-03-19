# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Marcin Kornat <rarvolt@gmail.com>
pkgname=labelle
pkgver=1.4.4
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
    'python-pytest'
    'python-pytest-image-diff'
    'python-pytest-qt'
)
source=(
        "${pkgname}-${pkgver}.tar.gz::https://github.com/labelle-org/labelle/archive/v${pkgver}.tar.gz"
        "91-dymo-labelmanager-pnp.rules"
        "dymo-labelmanager-pnp.conf"
)
sha512sums=('8e90ba989c967f1eb6ca6723dc6c6fe7551f81373746e6dc917014260d32cb6edd66867f2b407f483f728550833487bb0d7efa58920431a1f01a48380b71d925'
            '3768fdfc8345d909cac837fc6582c3f064695a211c9150f6dd2e3a2b846c4265efd5ac24c629c68dfa6ac7421604c448d47e4fb0966a68773107502cc7f6f183'
            '1cd7294374617035e0f3614f2a2914647879fa58cf3da0d7c5705697e30961161cb21e10b45fa2bd417c5487b585cc7bdfec1ee863fa73a3f47ddd553702fe8d')

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
    # The `test_main_window` test passes just fine in a clean chroot
    # or on systems with no label printer attached.
    # However, in practice, many users build their packages on
    # machines with printers attached, which fails the assertion,
    # so the test causes more hassle in the long run than it’s worth.
    PYTHONPATH="${PWD}/tmp_install/${_site_packages}" \
        pytest src -k 'not test_main_window'
}

package() {
    install -Dm644 91-dymo-labelmanager-pnp.rules "${pkgdir}/etc/udev/rules.d/91-dymo-labelmanager-pnp.rules"
    install -Dm644 dymo-labelmanager-pnp.conf "${pkgdir}/etc/usb_modeswitch.d/dymo-labelmanager-pnp.conf"

    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
