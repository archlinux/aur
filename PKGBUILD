# Maintainer: Emiliano Gandini Outeda <emiliano.gandini@protonmail.com>

pkgname=trustsight
pkgver=0.26.0
pkgrel=1
pkgdesc='Audits AUR PKGBUILD updates before install: structure, commands, novelty'
arch=('any')
url='https://github.com/emiliano-go/trustsight'
license=('MIT')
# The python-pygit2 floor is a security floor, not a preference: pygit2 < 1.20.1
# bundles libgit2 versions with the delta result-size allocation flaw and the
# libssh2 remote-path command injection (CVE-2026-5917).  Kept in step with
# pyproject.toml by tests/test_pkgbuild.py.
depends=(
  'python'
  'python-pygit2>=1.20.1'
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
  'python-pytest-xdist'
  # check() runs the corpus tests, which create a throwaway repository with
  # the git binary even when the archive carries no checkout.
  'git'
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

sha256sums=('0ef0321b422775cb0df70f4f7bec3045fed0abf4ec9573f919f3a5d8cdfb93ee'
            '50a7a4059cc11daa271699d947e9a265e0728a6d19972713b24659b40b24f87b')

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
  # A stale 'pip install --user' package in ~/.local shadows the system
  # package for a --system-site-packages venv, so the suite would test the
  # builder's user install rather than the system python-pygit2 this
  # PKGBUILD depends on.  Disable the user site so check() is reproducible.
  export PYTHONNOUSERSITE=1
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
