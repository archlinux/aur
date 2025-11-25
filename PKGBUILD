# Maintainer: a821 (nospam) mail de

pkgname=python-pyreadr
_name=${pkgname#python-}
pkgver=0.5.4
pkgrel=1
pkgdesc='Reads/writes R RData and Rds files into/from pandas data frames'
arch=('x86_64')
url="https://github.com/ofajardo/pyreadr"
license=('AGPL-3.0-or-later')
depends=('bzip2' 'python-pandas' 'xz' 'zlib')
makedepends=('cython' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-xarray')
optdepends=('python-xarray: for 3D array support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "fix_pkg_warning.patch")
sha256sums=('0ae77519500ba03ec8b82665b238008dade245127e01146983bb2edb2561f6ff'
            '86b83f59ff1e0ee5b1d4e1c6652a0f872ee527e2bc2b680131654e069111d8a8')

prepare() {
    cd "${_name}-${pkgver}"
    patch -p1 < ../fix_pkg_warning.patch
}

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_name}-${pkgver}"
    local _pyver=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
    PYTHONPATH="$PWD/build/lib.linux-x86_64-cpython-$_pyver" python tests/test_basic.py
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: set ts=4 sw=4 et:
