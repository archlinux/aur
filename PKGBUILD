# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=qiskit-addon-aqc-tensor
pkgname=python-${_name}
pkgver=0.3.1
pkgrel=1
pkgdesc="Approximate quantum compilation with tensor networks"
arch=(any)
url=https://github.com/Qiskit/qiskit-addon-aqc-tensor
license=(Apache-2.0)
depends=(
    python-numpy
    python-plum-dispatch
    python-qiskit
    python-scipy
    python-wrapt
)
makedepends=(
    git
    python-build
    python-installer
    python-hatchling
)
checkdepends=(
    python-pytest
    python-pytest-randomly
    python-pytest-subtests
    python-qiskit-addon-utils
)
source=($_name::git+https://github.com/Qiskit/$_name.git#tag=$pkgver)
b2sums=('775bcabb2696b8d29fa8b5c9f1f680f6249f6344fa7c2b4271d6f71ca1c6bf9788d87c2a89da33ed5bcade84fd8b4d5cf9250e841378523d76ce6c9054a176ba')

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

check() {
    cd $_name
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    rm -rf ${_name//-/_}
    test-env/bin/python -P -m pytest -o addopts="" test
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
