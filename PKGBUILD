# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-ibm-runtime
pkgname=python-${_pkgname}
pkgver=0.46.1
pkgrel=1
pkgdesc="IBM Client for Qiskit Runtime"
arch=(any)
url=https://github.com/Qiskit/qiskit-ibm-runtime
license=(Apache-2.0)
depends=(
    blas-openblas
    python-dateutil
    python-ibm-platform-services
    python-ibm-quantum-schemas
    python-numpy
    python-packaging
    python-pybase64
    python-pydantic
    python-qiskit
    python-qiskit-aer
    python-requests
    python-requests-ntlm
    python-samplomatic
    python-urllib3
)
optdepends=(
    "python-plotly: interactive plots"
    "python-qiskit-aer: support for simulator and noise models"
)
makedepends=(
    git
    python-build
    python-installer
    python-setuptools
    python-setuptools-scm
)
checkdepends=(
    python-ddt
    python-plotly
    python-pytest
)
source=(
    $_pkgname::git+https://github.com/Qiskit/$_pkgname.git#tag=$pkgver
    fix-test-data-serialization.patch
)
b2sums=('dd9f0ffd7acee454c5ff787308745ef02037e75a713cdc78f87e4b78275b9b26a3fcf4cc78e0dfed031b27e340996e2e30cbd56ed6be87881ecb7b84102139d5'
        '829f30f643704e96361f9cf222f562f1a0a2078e9b4b33e20a2cd5235ad9d1f9bf282f2981e5a582004a57ccc546d940577b9c65fe37f9f0f24087fd863b0420')

prepare() {
    patch -Np1 -d $_pkgname < fix-test-data-serialization.patch
}

build() {
    cd $_pkgname
    export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $_pkgname
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    rm -rf ${_pkgname//-/_}
    test-env/bin/python -P -m pytest -o addopts="" test/unit
}

package() {
    cd $_pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
