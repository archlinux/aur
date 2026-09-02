# Maintainer: sasvari <sasvari@fastmail.com>
# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
#             adapted from package python2-scikit-rf
_name="scikit-rf"
pkgname="python-${_name}"
pkgver=2.1.0
pkgrel=1
pkgdesc="Scikit-rf (aka skrf) is a python package for RF/Microwave engineering"
arch=(any)
url="https://github.com/scikit-rf/scikit-rf"
license=("BSD-3-Clause")
depends=(
    "python"
    "python-numpy"
    "python-scipy"
    "python-pandas"
    "python-typing_extensions"
    # matplotlib and networkx aren't strictly necessary,
    # but they are in use _quite_ often
    "python-matplotlib"
    "python-networkx"
)
makedepends=(
    "git"
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
optdepends=(
    "python-openpyxl: for Excel read/write support"
    "python-pyvisa: for VISA (instrument control) support"
    "python-pyvisa-py: for VISA support, alternative backend"
    "python-bokeh: for running examples in the notebook"
)
checkdepends=(
  "python-pytest"
)

b2sums=('346ac2def403fdc8ea69169b2d7e4c21bbdf3476a2f36dc6073b8260833d86dcf66d5216081530cfe4aabddbbaf1f98c1535f5c32d1020c333820a17ce31cc78')
source=("${pkgname}::git+${url}#tag=v${pkgver}")

prepare() {
    cd "${pkgname}"

    # We don't need coverage test; disable it
    sed -E -i '/^addopts/ s/--cov=skrf\s*//g' pyproject.toml
}

build() {
    cd "${pkgname}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${pkgname}"

    # Install the package in a virtual environment and run the tests
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -P -m pytest
}

package() {
    cd "${pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # BSD-3-Clause license needs to be installed
    install -Dm0644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set ts=4 sw=4 et:
