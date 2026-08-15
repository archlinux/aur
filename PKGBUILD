# Maintainer: Axel Haustant <noirbizarre@gmail.com>
#
# VCS package: tracks the `main` branch. `pkgver` is derived by makepkg, so this
# PKGBUILD carries no `@VERSION@` placeholder.

pkgname=git-synchronizer-git
_pkgname=git-synchronizer
pkgver=0.3.0.r1.gf99d2c4
pkgrel=1
pkgdesc="Easily synchronize your local branches and worktrees (git)"
arch=('x86_64' 'aarch64')
url="https://github.com/noirbizarre/git-synchronizer"
license=('MIT')
depends=('gcc-libs' 'glibc' 'git')
makedepends=('cargo' 'git')
provides=("$_pkgname=$pkgver" 'git-sync')
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # `s/^v//` because the project tags with a `v` prefix, which pkgver forbids.
  git describe --long --tags 2>/dev/null |
    sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "0.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release --all-features
}

package() {
  cd "$_pkgname"

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
