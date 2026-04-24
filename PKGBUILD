# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=fastexcel
pkgname=python-${_name}
pkgver=0.20.0
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
b2sums=('3f4bb4f25a1eac14d91b86e131b83c4b1cda04518dda071e464e41f57a913bbc2269b24da9a41d34c93f941cac9330bf56e8192c99230e273f49082aa5cda95a')

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
