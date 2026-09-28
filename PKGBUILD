# Maintainer: a821 (nospam) mail de

pkgname=python-pyreadr
_name=${pkgname#python-}
pkgver=0.5.7
pkgrel=1
pkgdesc='Reads/writes R RData and Rds files into/from pandas data frames'
arch=('x86_64')
url="https://github.com/ofajardo/pyreadr"
license=('AGPL-3.0-or-later')
depends=('bzip2' 'python-pandas' 'python-narwhals' 'xz' 'zlib')
makedepends=('cython' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-xarray' 'python-polars')
optdepends=(
    'python-polars: for polars support'
    'python-xarray: for 3D array support'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "fix_pkg_warning.patch")
sha256sums=('039ca25dd68b9ff3ded4267db4e78f936b05ada2fd2bc66e08919d2a0d2a93cd'
            '7805f6abbfb97300bdfe6a6236f89d90fa1aab303c96a71c327068628e51a212')

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
