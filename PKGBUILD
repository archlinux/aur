# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=fastexcel
pkgname=python-${_name}
pkgver=0.18.0
pkgrel=2
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
b2sums=('600e5459a8f01c4e4d34f4c0f2f0f1e5d463908e5cf86d81e652b89bc70ffc64f79a35625014e7cf0ab75ab00ac5200bd1d258b52b9b643952a93381fb1377fb')

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
