# Maintainer: Emiliano Gandini Outeda <emiliano.gandini@protonmail.com>

pkgname=trustsight
pkgver=0.19.0
pkgrel=1
pkgdesc='Audits AUR PKGBUILD updates before install: structure, commands, novelty'
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
  # The property-based parser tests (spec §12) import hypothesis; the
  # package's own check() runs the suite.
  'python-hypothesis'
)
optdepends=(
  'pyalpm: native version comparison (faster discovery)'
)
# The release tarball carries a detached signature made with the pinned
# commit-signing key, whose private half is not available to CI.  makepkg
# verifies the signature because the key is pinned here and the `.sig` is a
# declared source; the checksum below is the *real* hash of that signature,
# never `SKIP`.
validpgpkeys=('F759D6D49B0A395AB922414A5CC3B4C50D37E793')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.sig::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.sig")

sha256sums=('5dd9b52e45f06cc50d52255f831e658a54ae8daf505b2f03782cc748f65c8f48'
            '2bf19171ec9285d727c2812638ce2dd08ec9156caf96905f99ece9a6a080f93d')

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
