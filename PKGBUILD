# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=json_repair
pkgname=python-$_name
pkgver=0.59.10
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
optdepends=(
    "python-jsonschema: jsonschema support"
    "python-pydantic: pydantic support"
)
checkdepends=(
    python-jsonschema
    python-pydantic
    python-pytest
)
source=($_name-$pkgver.tar.gz::https://github.com/mangiucugna/$_name/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('9985fabb2137a98b85c25923a8eeba33fed9b2c0102118ba6470c2d098202ebac57f0497ce6c05c08b6c2517fcfd88239d5f873843bfbc344a41b492c4ba5a97')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $_name-$pkgver
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -P -m pytest -o addopts="" --ignore=tests/test_performance.py
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
