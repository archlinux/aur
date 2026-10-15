# Maintainer: Emiliano Gandini Outeda <emiliano.gandini@protonmail.com>

pkgname=trustsight
pkgver=0.20.1
pkgrel=1
pkgdesc='Audits AUR PKGBUILD updates before install: structure, commands, novelty'
arch=('any')
url='https://github.com/emiliano-go/trustsight'
license=('MIT')
# The python-pygit2 floor is a security floor, not a preference: pygit2 < 1.20
# bundles libgit2 versions with the delta result-size allocation flaw.  Kept in
# step with pyproject.toml by tests/test_pkgbuild.py.
depends=(
  'python'
  'python-pygit2>=1.20.0'
  'python-tldextract>=5.0'
  'python-rich>=13.0'
  'python-typer>=0.12'
  'python-cryptography>=42.0'
  'python-yaml>=6.0'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-hatchling'
  'python-pytest'
  # The property-based parser tests import hypothesis; the
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

sha256sums=('acc1fbb50e6fa8ac6866a4aaa3e01b01a0d6f6c7f239ae3ba08d86931f734465'
            'c852da1c9b8e73c5c2ef2ddaac112581dc1847ef3da7737a56fcedc59088dbcb')

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
  # test_fetcher and test_rebaseline need network/corpus; test_contract_artifact
  # needs the repository-root contract/contract.json, which is not part of the
  # wheel this check installs.  They are repo gates, not package gates.
  _test-env/bin/python -m pytest tests/ -q \
    --ignore=tests/test_fetcher.py \
    --ignore=tests/test_rebaseline.py \
    --ignore=tests/test_contract_artifact.py
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim:set ts=2 sw=2 et:
