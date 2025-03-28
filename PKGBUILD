# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=qiskit-addon-cutting
pkgname=python-${_name}
pkgver=0.10.0
pkgrel=1
pkgdesc="Reduce width and depth of quantum circuits by cutting gates and wires"
arch=(any)
url=https://github.com/Qiskit/qiskit-addon-cutting
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
    python-ddt
    python-pytest
    python-qiskit-aer
    python-qiskit-ibm-runtime
)
source=($_name-$pkgver.tar.gz::https://github.com/Qiskit/$_name/archive/refs/tags/$pkgver.tar.gz)
b2sums=('d807482bb6e53c385152bce0909d6b76848e5ce5b0f722357d53e699d80fce188f7dc0eb4fa28ba2b0190e72c0a0cc2d36e51ec0b16620581cf405b77e62f069')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $_name-$pkgver
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    python -m installer --destdir=../test_dir dist/*.whl
    rm -rf qiskit_addon_cutting
    PYTHONPATH="$PWD/../test_dir/usr/lib/python$python_version/site-packages" pytest test
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
