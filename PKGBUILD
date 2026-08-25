# Maintainer: Arkady Buryakov <arkady@buryakov.pro>
#
# Template — not a buildable PKGBUILD. On release the publish_aur workflow
# substitutes 0.5.0, fills sha256sums via updpkgsums, generates .SRCINFO,
# and pushes the rendered files to the AUR; nothing is committed back here.
pkgname=workforest
pkgver=0.5.0
pkgrel=1
pkgdesc="Git worktree forest management: per-branch worktrees with project-defined setup hooks"
arch=(any)
url="https://github.com/ArkadyBuryakov/workforest"
license=(MIT)
depends=(python python-yaml git)
makedepends=(python-build python-installer python-wheel python-hatchling)
optdepends=('fzf: interactive TUI (workforest tui)')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4101bedbe39adf321ed6d76aac0c8e09d561840725f4ee1741d0295f370ce7fa')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  # (the wheel's share/man data lands in /usr/share/man: man pages included)

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Shell completions (the wf function itself comes from `workforest shell-init`)
  install -Dm644 src/workforest/shell/completion.bash \
    "$pkgdir/usr/share/bash-completion/completions/workforest"
  install -Dm644 completions/_workforest \
    "$pkgdir/usr/share/zsh/site-functions/_workforest"

  # Reference configs (DESIGN §4.3)
  install -Dm644 src/workforest/examples/config.yaml \
    "$pkgdir/usr/share/doc/$pkgname/examples/config.yaml"
  install -Dm644 src/workforest/examples/.workforest.yaml \
    "$pkgdir/usr/share/doc/$pkgname/examples/workforest.project.yaml"
}
