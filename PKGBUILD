# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=fastexcel
pkgname=python-${_name}
pkgver=0.19.0
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
b2sums=('4c23cb16cba532f3cbaa048f39ee46d5121be1ea4f51343aae9acb0c737285bd7e903badf605de9fbadf7a7f55a84120cc1119b30704f93f3181663fa7855d7a')

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
