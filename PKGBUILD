# Maintainer: a821

pkgname=python-hnswlib
pkgver=0.9.0
pkgrel=1
pkgdesc="Header-only C++/python library for fast approximate nearest neighbors"
url="https://github.com/nmslib/hnswlib"
arch=('x86_64')
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'libstdc++' 'python-numpy')
makedepends=('python-setuptools' 'pybind11'
             'python-build' 'python-installer' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('65dfb6639cb7d1acbdaeec1429b978fb657a9bf368ebb8353109167394537823')

build() {
    cd "${pkgname#python-}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${pkgname#python-}-${pkgver}"
    local _pyver=$(python -c 'import sys; print("%d%d" % sys.version_info[:2])')
    PYTHONPATH=build/lib.linux-x86_64-cpython-$_pyver  python -m unittest discover \
                   --start-directory tests/python --pattern "bindings_test*.py"
}

package() {
    cd "${pkgname#python-}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
# vim: set ts=4 sw=4 et:
