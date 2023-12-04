# Maintainer: a821

pkgname=python-hnswlib
pkgver=0.8.0
pkgrel=1
pkgdesc="Header-only C++/python library for fast approximate nearest neighbors"
url="https://github.com/nmslib/hnswlib"
arch=('x86_64')
license=('Apache')
depends=('python-numpy')
makedepends=('python-setuptools' 'pybind11'
             'python-build' 'python-installer' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cf61d7dd8dc9bfba7f4abe0ed26698e90ac9f49a0badb2e1b0f3ba89b72cf3bb')

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
