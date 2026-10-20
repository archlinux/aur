# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=ffsim
pkgname=python-${_pkgname}
pkgver=0.0.84
pkgrel=1
pkgdesc="Faster simulation of fermionic quantum circuits"
arch=(x86_64)
url=https://github.com/qiskit-community/ffsim
license=(Apache-2.0)
depends=(
    python-jax
    python-numpy
    python-opt_einsum
    python-orjson
    python-pyscf
    python-qiskit
    python-scipy
    python-typing_extensions
)
makedepends=(
    git
    python-build
    python-installer
    python-maturin
)
checkdepends=(python-pytest)
source=($_pkgname::git+https://github.com/qiskit-community/$_pkgname#tag=v$pkgver)
b2sums=('1c26f5386d99f2905152605e152fb9f42ad92902df075248aae220438785ec339253eca67e560daeb5d56cacbeca4ad5aad2c0c72a2b43b3c00b13584af0b11c')

build() {
    cd $_pkgname
    python -m build --wheel --no-isolation
}

check() {
    cd $_pkgname
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -P -m pytest -o addopts="" tests/python
}

package() {
    cd $_pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
