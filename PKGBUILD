# Maintainer: Axel Haustant <noirbizarre@gmail.com>
#
# Source package. `0.3.0` and `54ebe41b46b456a47de9f8fb32dc76219f517f556d8b7e3cdffc7efb0e52e59f` are substituted by
# .github/workflows/aur.yml from the published release assets.

pkgname=git-synchronizer
pkgver=0.3.0
pkgrel=1
pkgdesc="Easily synchronize your local branches and worktrees"
arch=('x86_64' 'aarch64')
url="https://github.com/noirbizarre/git-synchronizer"
license=('MIT')
# `git` is a runtime dependency, not just a build one: every operation shells
# out to it, and the test suite builds real repositories with it.
depends=('gcc-libs' 'glibc' 'git')
makedepends=('cargo')
provides=('git-sync')
# The project tags with a `v` prefix while `pkgver` is the bare version, hence
# the `v$pkgver` in the URL against `$pkgname-$pkgver.tar.gz` as the file name.
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('54ebe41b46b456a47de9f8fb32dc76219f517f556d8b7e3cdffc7efb0e52e59f')

prepare() {
  cd "$pkgname-$pkgver"
  # Arch's Rust package guidelines: vendor the dependency graph up front so
  # build() can run offline with `--frozen`.
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # `--frozen` honours the tracked Cargo.lock shipped in the tarball, so the
  # package is built from the exact dependency graph upstream CI tested.
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/git-sync "$pkgdir/usr/bin/git-sync"

  # build.rs writes the man pages and completions into the build script's
  # OUT_DIR, which cargo places in a hash-suffixed directory.
  local out
  out=$(find target/release/build -type d -path '*git-synchronizer-*/out' -print -quit)
  [ -n "$out" ] || return 1

  # The man pages are not a nicety: git rewrites `git sync --help` into
  # `git help sync`, which runs `man git-sync` and fails without them.
  install -Dm644 -t "$pkgdir/usr/share/man/man1" "$out"/man/*.1

  install -Dm644 "$out/completions/git-sync.bash" \
    "$pkgdir/usr/share/bash-completion/completions/git-sync"
  install -Dm644 "$out/completions/_git-sync" \
    "$pkgdir/usr/share/zsh/site-functions/_git-sync"
  install -Dm644 "$out/completions/git-sync.fish" \
    "$pkgdir/usr/share/fish/vendor_completions.d/git-sync.fish"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
