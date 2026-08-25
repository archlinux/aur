pkgname=trustsight
pkgver=0.13.1
pkgrel=1
pkgdesc='A CLI tool to vet AUR package updates before install'
arch=('any')
url='https://github.com'
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
sha256sums=('6c19cea4b1a37eaed1d50deb4ee8551535dac084d6352f19242ce23593f7bbbe')

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

