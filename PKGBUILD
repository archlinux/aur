# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=returns
pkgname="python-$_pkgname"
pkgver=0.22.0
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
sha256sums=('c39a2b9510b676499134f0010f9af5e83ac15678456779d06fe9a2fe3b3ed94c')
b2sums=('b34e84a5ef59b6f8b1577b7de1116ebd255faef10511d471c35c9ab3b0bc6740f6a66c781482a5d982ce61c91ad8ea2330e4bdafa95ace51e817b67704a1bf2a')

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
