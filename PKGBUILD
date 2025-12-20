# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=json_repair
pkgname=python-$_name
pkgver=0.54.3
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
b2sums=('60f8571ea3c4ab3eb86e67c1d2ab510aad9a8ed6a851c252d625521d3e78677e011b1b647e4ef3bfba6c93ec49971cbddf8ada847b0861dd3c4e481835fa740e')

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
