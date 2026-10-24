# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=qiskit-addon-slc
pkgname=python-$_name
pkgver=0.2.0
pkgrel=1
pkgdesc="Reducing PEC sampling overhead with shaded lightcones"
arch=(any)
url=https://github.com/Qiskit/qiskit-addon-slc
license=(Apache-2.0)
depends=(
    python-matplotlib
    python-pauli-prop
    python-plotly
    python-qiskit
    python-rustworkx
    python-samplomatic
)
makedepends=(
    git
    python-build
    python-installer
    python-maturin
)
checkdepends=(
    python-pytest
    python-pytest-subtests
    python-qiskit-ibm-runtime
)
source=(
    $_name::git+https://github.com/Qiskit/$_name.git#tag=$pkgver
    fix-tests.patch
)
b2sums=('1e36da27aeabda371067d6f5157181106213cd9d87b1e7eadeb312272e166da365c6d995b413d727f07d92c7fa9c88dc0ae73cf89d209b7d56a1d089a4745c97'
        '6db9659dac057426a1ce4b1a42dc96f3cbc92763b7b9cc58191b17d86839579ae213bf6f23074114ca662e9567280455246ddd67c4c763c3b2abc2e8d28e664e')

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

check() {
    cd $_name
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    rm -rf ${_name//-/_}
    test-env/bin/python -P -m pytest -o addopts="" tests
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
