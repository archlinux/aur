# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Marcin Kornat <rarvolt@gmail.com>
pkgname=labelle
pkgver=1.4.2
pkgrel=3
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
        "github-pr-137.patch"
)
sha512sums=('4d66e2fc3c9946479dc338475875d65953d6ecb4f740d8f4b2989cd95f29ba52e8fc59cd78b38861a18d9b31f83dcba4119589ea496d3978980cc1d19b4c71fd'
            'd0de94bbd8bf850b0b7757d0043f769ab019d0dce75ddc89959a62de1ce9adfd54a2e0a2a86e500040194340212c1e02c79e0ad5c861033f875d1275a61b61a0'
            '1cd7294374617035e0f3614f2a2914647879fa58cf3da0d7c5705697e30961161cb21e10b45fa2bd417c5487b585cc7bdfec1ee863fa73a3f47ddd553702fe8d'
            'a9504c6d245edbc79c63a1b994343fa63db5f4144ceb5c46bcc6376b59acb74190d03c192f2e8acf13f1612ce7ed280143e41a662530003b54fc3bcf2f5f4f23')

prepare() {
    cd "${pkgname}-${pkgver}"

    # Unpin dependency range
    sed -i -E -e 's/"(hatchling|hatch-vcs) [^"]+"/"\1"/g' pyproject.toml

    # Remove this patch once the upstream author has merged PR #137 and
    # included it in a stable release.
    # See also: https://github.com/labelle-org/labelle/pull/137
    echo >&2 'Applying patch to match the latest API of the barcode library'
    patch -p1 < ../github-pr-137.patch
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
