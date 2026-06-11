# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=json_repair
pkgname=python-$_name
pkgver=0.60.1
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
b2sums=('7d690e55272f8c4f295fc76949e0b14e6c7b4da8fe1179cac46a236f3713a18d37f6adb62d4db4b9ddd812d88259e19e6e9a0a802c038bd0340b598987320637')

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
