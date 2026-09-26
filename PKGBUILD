# Maintainer: SaintFore <forevergoodforest@outlook.com>

pkgname=leetcode-fsrs-git
pkgver=2.0.0.r101.gb98d4ca
pkgrel=1
pkgdesc="Terminal-first LeetCode review planner powered by FSRS (development version)"
arch=('any')
url="https://github.com/SaintFore/LeetCodeCLI"
license=('MIT')
depends=(
  'python'
  'python-fsrs>=6.3'
  'python-keyring>=25'
  'python-requests>=2.32'
  'python-textual>=8.2'
  'python-typer>=0.27'
)
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio')
provides=('leetcode-fsrs')
conflicts=('leetcode-fsrs' 'leetcode-fsrs-cli' 'leetcode-fsrs-cli-bin')
source=('leetcode-fsrs::git+https://github.com/SaintFore/LeetCodeCLI.git#branch=main')
b2sums=('SKIP')

pkgver() {
  cd leetcode-fsrs
  local upstream revision commit
  upstream=$(sed -n 's/^version = "\([0-9.]\+\)"/\1/p' pyproject.toml)
  revision=$(git rev-list --count HEAD)
  commit=$(git rev-parse --short HEAD)
  printf '%s.r%s.g%s' "$upstream" "$revision" "$commit"
}

build() {
  cd leetcode-fsrs
  python -m build --wheel --no-isolation
}

check() {
  cd leetcode-fsrs
  python -m pytest -q
}

package() {
  cd leetcode-fsrs
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 docs/architecture.md "$pkgdir/usr/share/doc/$pkgname/architecture.md"
  install -Dm644 docs/sync.md "$pkgdir/usr/share/doc/$pkgname/sync.md"
}
