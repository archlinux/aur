# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=returns
pkgname="python-$_pkgname"
pkgver=0.24.0
pkgrel=1
pkgdesc="Make your functions return something meaningful, typed, and safe"
arch=('any')
url="https://returns.readthedocs.io"
license=('MIT')
depends=('python' 'python-typing_extensions')
makedepends=('python-poetry-core' 'python-build' 'python-installer' 'python-wheel')
checkdepends=(
  'python-pytest' 'python-pytest-mypy-plugins' 'python-pytest-subtests' 'python-pytest-randomly'
  'python-pytest-cov'
  'python-hypothesis' 'python-anyio' 'python-httpx' 'python-attrs' 'python-trio' 'python-tomlkit'
)
optdepends=(
  'mypy: For mypy compatibility'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/dry-python/returns/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3494bf8630860243b3d6d2bcdfe9096377b7c59737b99f2c0954496087719b57')
b2sums=('bdfd6f64d76246a4a5f79dedcf6141a1ece45861980542a932a7b915bfc6f7cd27078899eb1f954508aa3084de40985c1a828afdc76176a81e9b0c6c24099fd3')

build() {
  cd "$_pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"

  export PYTHONPATH="$PWD"
  pytest \
    -p returns.contrib.pytest.plugin \
    --cov-fail-under=0 \
    returns docs/pages tests
}

package() {
  cd "$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
