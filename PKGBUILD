# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-ibm-transpiler
pkgname=python-${_pkgname}
pkgver=0.10.3
pkgrel=1
pkgdesc="A library to use the Qiskit Transpiler Service and the AI-powered transpiler passes"
arch=(any)
url=https://github.com/Qiskit/qiskit-ibm-transpiler
license=(Apache-2.0)
depends=(
    python-backoff
    python-networkx
    python-qiskit
    python-qiskit-ibm-runtime
    python-qiskit-qasm3-import
    python-requests
)
makedepends=(
    python-build
    python-installer
    python-setuptools
    python-wheel
)
source=($_pkgname-$pkgver.tar.gz::https://github.com/Qiskit/$_pkgname/archive/$pkgver.tar.gz)
b2sums=('7a7ad4190f4876048dfe94e6b02bb73da8f661360b984118dfa5aa40699126dae5a221109a94614c2aa5baa25f3725766256ffe01caa256e0076e3a25d9d1946')

build() {
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    # Remove tests from site-packages
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    echo "$pkgdir"/$site_packages/tests
    rm -rf "$pkgdir"/$site_packages/tests
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
