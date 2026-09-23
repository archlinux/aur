# Maintainer: Emiliano Gandini Outeda <emiliano.gandini@protonmail.com>

pkgname=trustsight
pkgver=0.16.1
pkgrel=1
pkgdesc='Audits AUR PKGBUILD updates before you install: detects structural changes, suspicious commands, typosquatting, and novelty signals'
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
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")

sha256sums=('aa94c1777cf6cfc328f161bd3d4121f3dd088792a910ae57b89dfa31f5d973b8')

build() {
  cd "$pkgname-$pkgver"
  # --no-isolation: the build backend (hatchling) is a declared makedepend.
  # The default builds in an isolated venv and downloads hatchling from PyPI
  # with no version and no hash, which is both unreproducible and an
  # unpinned code path running as the builder. Arch packaging policy is
  # --no-isolation for exactly this reason.
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  rm -rf _test-env
  python -m venv --system-site-packages _test-env
  # Drop the system-installed trustsight so the fresh wheel installs
  # cleanly: --system-site-packages inherits the old package files and
  # entry-point script, both of which collide with the new wheel.
  find _test-env/lib -path '*/trustsight*' -exec rm -rf {} + 2>/dev/null || true
  rm -f _test-env/bin/trustsight
  _test-env/bin/python -m installer dist/*.whl
  _test-env/bin/python -m pytest tests/ -q --ignore=tests/test_fetcher.py --ignore=tests/test_rebaseline.py
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim:set ts=2 sw=2 et:
