# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=qiskit-addon-utils
pkgname=python-${_name}
pkgver=0.2.0
pkgrel=1
pkgdesc="Utilities to support workflows leveraging Qiskit addons"
arch=(any)
url=https://github.com/Qiskit/qiskit-addon-utils/
license=(Apache-2.0)
depends=(
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
)
source=($_name-$pkgver.tar.gz::https://github.com/Qiskit/$_name/archive/refs/tags/$pkgver.tar.gz)
b2sums=('3a9b50a383f69e94a1819ef0daa3f475262299f9d24266d2666f32cc8152c2e57c90c52641e3364c8bc16621c8843c1a9bd594270e73eeb2fd094f7c9963c7e1')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $_name-$pkgver
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    python -m installer --destdir=../test_dir dist/*.whl
    rm -rf ${_name//-/_}
    PYTHONPATH="$PWD/../test_dir/usr/lib/python$python_version/site-packages" pytest test
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
