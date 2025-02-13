# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-ibm-runtime
pkgname=python-${_pkgname}
pkgver=0.35.0
pkgrel=2
pkgdesc="IBM Client for Qiskit Runtime"
arch=(any)
url=https://github.com/Qiskit/qiskit-ibm-runtime
license=(Apache-2.0)
depends=(
    python-dateutil
    python-ibm-platform-services
    python-pydantic
    python-qiskit
    python-qiskit-aer
    python-requests
    python-requests-ntlm
    python-urllib3
    python-websocket-client
)
optdepends=('python-plotly: interactive plots')
makedepends=(
    python-build
    python-installer
    python-setuptools
    python-setuptools-scm
    python-wheel
)
checkdepends=(
    python-ddt
    python-plotly
    python-pytest
    python-websockets
)
source=($_pkgname-$pkgver.tar.gz::https://github.com/Qiskit/$_pkgname/archive/$pkgver.tar.gz)
b2sums=('1c2448fd9d322ef99c48568e60da6700084ea5ad265046f170cfb2383f3c5d310aa103dcb2b518687bff80afbacb0fc5f9ba417953bdf18f835ecf26d8ed0ec6')

build() {
    cd $_pkgname-$pkgver
    export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $_pkgname-$pkgver
    local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    python -m installer --destdir=../test_dir dist/*.whl
    PYTHONPATH="$PWD/../test_dir$_site_packages" pytest test/unit
}

package() {
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    # Remove wrong files included in the wheel package
    local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    rm -r "$pkgdir"$_site_packages/{docs,tools}
}
