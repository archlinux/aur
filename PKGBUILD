# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=json_repair
pkgname=python-$_name
pkgver=0.40.0
pkgrel=1
pkgdesc="A python module to repair invalid JSON, commonly used to parse the output of LLMs"
arch=(any)
url=https://github.com/mangiucugna/json_repair
license=(MIT)
depends=(python)
makedepends=(
    python-build
    python-installer
    python-setuptools
    python-wheel
)
checkdepends=(python-pytest)
source=($_name-$pkgver.tar.gz::https://github.com/mangiucugna/$_name/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('570dc7f80ef4f3dba29c2ba48255fa9b320df3de62900da620c0571ad96648248dc1ebed6d67abec4baa7e4f5dbbbdab5ff6c251d0495b4f6d209075e24cc0e7')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $_name-$pkgver
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    python -m installer --destdir=../test_dir dist/*.whl
    PYTHONPATH="$PWD/../test_dir/usr/lib/python$python_version/site-packages" pytest tests/test_json_repair.py
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
