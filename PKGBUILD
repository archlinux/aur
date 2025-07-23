# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-ibm-transpiler
pkgname=python-${_pkgname}
pkgver=0.13.1
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
b2sums=('a0df65602961688738b86f2dfc1e929300214aa88191b1933b47931c802f00185793919061f0654231af2b11d55df4407c939f38a58ceec7d555c3995b223919')

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
