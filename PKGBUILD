# Maintainer: Arkady Buryakov <arkady@buryakov.pro>
#
# Template — not a buildable PKGBUILD. On release the publish_aur workflow
# substitutes 0.9.0, fills sha256sums via updpkgsums, generates .SRCINFO,
# and pushes the rendered files to the AUR; nothing is committed back here.
pkgname=workforest
pkgver=0.9.0
pkgrel=1
pkgdesc="Git worktree forest management: per-branch worktrees with project-defined setup hooks"
arch=(x86_64 aarch64)
url="https://github.com/ArkadyBuryakov/workforest"
license=(MIT)
depends=(git gcc-libs glibc)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3fb66547a575bece3130ba1e9e0efe614654871fd504cd5f7f308469b938fc0d')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --bin workforest
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/workforest "$pkgdir/usr/bin/workforest"
  ln -s workforest "$pkgdir/usr/bin/wf"

  # Man pages, from where the PyPI wheel ships them as data.
  local man=packaging/pypi/data/share/man
  install -Dm644 -t "$pkgdir/usr/share/man/man1" "$man/man1/workforest.1" "$man/man1/wf.1"
  install -Dm644 -t "$pkgdir/usr/share/man/man5" "$man/man5/workforest.5" "$man/man5/wf.5"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Shell completions (the wf function itself comes from `workforest shell-init`)
  install -Dm644 resources/shell/completion.bash \
    "$pkgdir/usr/share/bash-completion/completions/workforest"
  install -Dm644 completions/_workforest \
    "$pkgdir/usr/share/zsh/site-functions/_workforest"

  # Reference configs
  install -Dm644 resources/examples/config.yaml \
    "$pkgdir/usr/share/doc/$pkgname/examples/config.yaml"
  install -Dm644 resources/examples/.workforest.yaml \
    "$pkgdir/usr/share/doc/$pkgname/examples/workforest.project.yaml"
}
