# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-flippernested
_name=FlipperNestedRecovery
pkgver=2.3.5
pkgrel=4
pkgdesc="Recover keys from collected nonces using the Flipper Zero"
arch=(x86_64)
url=https://github.com/AloneLiberty/FlipperNestedRecovery
license=(LGPL-3.0-only)
depends=(
    python-protobuf
    python-pyserial
    xz
)
makedepends=(
    python-build
    python-installer
    python-setuptools
    python-wheel
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('29bc49071d1c92c9e217c21aac0830775ce9bb9c6cd909b1b896ec510bd7e83b73303b1c12d6e851e37630eb2000fa465e27121e339cf9a705b104c7543f67ab')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $_name-$pkgver
    python -m installer --destdir=../test_dir dist/*.whl
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    export PYTHONPATH=../test_dir/usr/lib/python$python_version/site-packages
    python tests/test_calculate.py
    python tests/test_import.py
    python tests/test_parse.py
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
