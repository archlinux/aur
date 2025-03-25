# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-ibm-transpiler
pkgname=python-${_pkgname}
pkgver=0.11.0
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
b2sums=('9b656c9f3343ba3929602fe432ea3873f085639b9dd4249ea9dff133de6a5512d48227634ff0a7f0d50ea658d8ced73b3e7c9953e832e5021b7164f7132e05a0')

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
