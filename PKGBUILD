# Maintainer: a821 (nospam) mail de

pkgname=python-pyreadr
_name=${pkgname#python-}
pkgver=0.5.3
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
sha256sums=('15c00b8a71d8f53f5104b4b9bfcb17526108c967085bec8fe78b5bde24c5d891'
            '31579968530b56d917990ffeffdf48dda109065a2a3786cd3557214e809d13e5')

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
