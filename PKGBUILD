# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=fastexcel
pkgname=python-${_name}
pkgver=0.20.1
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
b2sums=('5d4d7f4d09af1f15a456ae4c9fa634a77e896a91caa3b4b8665cf97c58e24d81309b083f3c75fb3837598f595b2a8bd19cfa6e5d04a2aee0156a0a224e266e58')

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
