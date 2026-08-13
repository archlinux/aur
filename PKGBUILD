# Maintainer: Arkady Buryakov <arkady@buryakov.pro>
pkgname=workforest
pkgver=0.2.1
pkgrel=1
pkgdesc="Git worktree forest management: per-branch worktrees with project-defined setup hooks"
arch=(any)
url="https://github.com/ArkadyBuryakov/workforest"
license=(MIT)
depends=(python python-yaml git)
makedepends=(python-build python-installer python-wheel python-hatchling)
optdepends=('fzf: interactive TUI (workforest tui)')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('47062e51ae374a9afce50ee0be6c39b08da6c96064450b3c2c58566d05fb7078')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

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
