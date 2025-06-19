# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-ibm-transpiler
pkgname=python-${_pkgname}
pkgver=0.11.1
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
b2sums=('c06502c2f51d53fc546263051cde639f2163afa24018701668a786fcf688fc70bbcd461ddf6e4f6d4603869867e5b6b8ab980d47e988ccc7332fcd6d0b134603')

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
