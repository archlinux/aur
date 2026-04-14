# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=typedunits
pkgname=python-${_pkgname}
pkgver=0.0.2
pkgrel=1
pkgdesc="A fast units and dimensions library with support for static dimensionality checking and protobuffer serialization"
arch=(x86_64)
url=https://github.com/quantumlib/TypedUnits
license=(Apache-2.0)
depends=(
    cython
    python-attrs
    python-numpy
    python-protobuf
    python-pyparsing
)
makedepends=(
    git
    python-build
    python-installer
    python-setuptools
    python-wheel
)
checkdepends=(python-pytest)
source=($_pkgname::git+https://github.com/quantumlib/TypedUnits#tag=v$pkgver)
b2sums=('a1eb5710f7696ed9bc1f925edd0837eb534c83e24a7ede8f4e0e03c3e4a96c3db480d0401e4dce20dc731ab0e78e1a48356f3cac84f284a77f89972f06db8d24')

build() {
    cd $_pkgname
    python -m build --wheel --no-isolation
}

check() {
    cd $_pkgname
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    python -m installer --destdir=../test_dir dist/*.whl
    rm -rf tunits
    PYTHONPATH="$PWD/../test_dir/usr/lib/python$python_version/site-packages" pytest test
}

package() {
    cd $_pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
