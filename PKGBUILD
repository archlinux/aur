# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=qiskit-addon-utils
pkgname=python-${_name}
pkgver=0.3.1
pkgrel=1
pkgdesc="Utilities to support workflows leveraging Qiskit addons"
arch=(any)
url=https://github.com/Qiskit/qiskit-addon-utils/
license=(Apache-2.0)
depends=(
    blas-openblas
    python-numpy
    python-qiskit
    python-rustworkx
)
makedepends=(
    python-build
    python-installer
    python-hatchling
)
checkdepends=(
    python-pytest
    python-qiskit-qasm3-import
    python-samplomatic
)
source=($_name-$pkgver.tar.gz::https://github.com/Qiskit/$_name/archive/refs/tags/$pkgver.tar.gz)
b2sums=('e173b6499e7aeda17bc69d64eb42498e062db0c182d049936169e137390b02f6b6e895889b8e42c4bf5ac12eedba0613bed98213c410fb7e5ba49685c4ad4fe1')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $_name-$pkgver
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    rm -rf ${_name//-/_}
    test-env/bin/python -P -m pytest -o addopts="" test
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
