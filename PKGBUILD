# Maintainer: Amiad Bareli <amiad@hatul.info>

pkgname=trustsight
pkgver=0.14.0
pkgrel=1
pkgdesc='A CLI tool to vet AUR package updates before install'
arch=('any')
url='https://github.com/emiliano-go/trustsight'
license=('MIT')
depends=(
  'python'
  'python-pygit2'
  'python-tldextract'
  'python-rich'
  'python-typer'
  'python-cryptography'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-hatchling'
  'python-pytest'
)
optdepends=(
  'pyalpm: native version comparison (faster discovery)'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('88c87a165664cc45dee893d059257ede464845c541a0834b0a9b8f3556d3009d')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel
}

check() {
  cd "$pkgname-$pkgver"
  rm -rf _test-env
  python -m venv --system-site-packages _test-env
  _test-env/bin/python -m installer dist/*.whl
  _test-env/bin/python -m pytest tests/ -q \
    --ignore=tests/test_fetcher.py \
    --ignore=tests/test_rebaseline.py \
    --ignore=tests/test_regressions.py \
    --ignore=tests/test_security_model.py \
    --ignore=tests/test_security_policy.py
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

