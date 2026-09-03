# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=fastexcel
pkgname=python-${_name}
pkgver=0.21.0
pkgrel=1
pkgdesc="A fast excel reader for Rust and Python"
arch=(x86_64)
url=https://github.com/ToucanToco/fastexcel
license=(MIT)
depends=(python)
makedepends=(
    git
    python-build
    python-installer
    python-maturin
)
optdepends=(
    "python-pandas: Traditional usage (requires python-pyarrow, too)"
    "python-polars: Polars support"
    "python-pyarrow: Arrow support"
)
checkdepends=(
    python-openpyxl
    python-pandas
    python-polars
    python-pytest
    python-pytest-mock
    python-pyarrow
    python-xlrd
)
source=($_name::git+https://github.com/ToucanToco/fastexcel#tag=v$pkgver)
b2sums=('74fbaada63249d321b5b8f75091e732d0b88cbd9604251d0ee9a3463de0a0aa286468b00c10c2693d4ea09ae09eaf51672c8d5c9c6115fffc2f5f5713df997cc')

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

check() {
    cd $_name
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    rm -rf python/fastexcel
    test-env/bin/python -P -m pytest -o addopts=""
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
