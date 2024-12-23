# Maintainer: a821

pkgname=python-pyreadr
_name=${pkgname#python-}
pkgver=0.5.2
pkgrel=2
pkgdesc='Reads/writes R RData and Rds files into/from pandas data frames'
arch=('x86_64')
url="https://github.com/ofajardo/pyreadr"
license=('AGPL-3.0-or-later')
depends=('bzip2' 'python-pandas' 'xz' 'zlib')
makedepends=('cython' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-xarray')
optdepends=('python-xarray: for 3D array support')
source=("$_name-$pkgver.$pkgrel.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "fix_pkg_warning.patch")
sha256sums=('8b4b0b58407ce0c388fd1fe6bf34c4101b5ee804d302b32dffb7b1aa68a42b04'
            '5e55680445764c4378a540d1890b175700f55968b5475e650000fea25930a5c9')

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
