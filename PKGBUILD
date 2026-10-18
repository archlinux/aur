# Maintainer: sasvari <sasvari@fastmail.com>
# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
#             adapted from package python2-scikit-rf
_name="scikit-rf"
pkgname="python-${_name}"
pkgver=2.2.0
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

b2sums=('4a89b83a59c2d0a69c52f581f3855bbd9996bc96fd3a030b422e559d94f293226333c10c214328047abd56e5d18fcd437b13ef037f576b207bf66a739175a85f')
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
