# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=returns
pkgname="python-$_pkgname"
pkgver=0.25.0
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
sha256sums=('4669838c319597c4cd0d1ddd7a04b41b78de71ce28e3ec2d04fab27c897a2d88')
b2sums=('0af309838348c012000dce94f2d42bd9a07ec002d354801f5f3b1f706a4c1e6d6d7589737e8d4110436c215980ccddf562607b3f9cd467d12c5b2ade98445aeb')

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
