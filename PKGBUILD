# Maintainer: Axel Haustant <noirbizarre@gmail.com>
#
# VCS package: tracks the `main` branch. `pkgver` is derived by makepkg, so this
# PKGBUILD carries no `@VERSION@` placeholder.

pkgname=git-wipe-git
_pkgname=git-wipe
pkgver=0.5.0.r0.g873f195
pkgrel=1
pkgdesc="Wipe out merged local branches and worktrees (git)"
arch=('x86_64' 'aarch64')
url="https://github.com/noirbizarre/git-wipe"
license=('MIT')
depends=('gcc-libs' 'glibc' 'git')
makedepends=('cargo' 'git')
provides=("$_pkgname=$pkgver")
# `replaces`/`conflicts` on the pre-rename name so `pacman -Syu` migrates
# anyone still on git-synchronizer-git instead of leaving both installed.
conflicts=("$_pkgname" 'git-synchronizer-git')
replaces=('git-synchronizer-git')
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

  install -Dm755 target/release/git-wipe "$pkgdir/usr/bin/git-wipe"

  # build.rs writes the man pages and completions into the build script's
  # OUT_DIR, which cargo places in a hash-suffixed directory.
  local out
  out=$(find target/release/build -type d -path '*git-wipe-*/out' -print -quit)
  [ -n "$out" ] || return 1

  # The man pages are not a nicety: git rewrites `git wipe --help` into
  # `git help wipe`, which runs `man git-wipe` and fails without them.
  install -Dm644 -t "$pkgdir/usr/share/man/man1" "$out"/man/*.1

  install -Dm644 "$out/completions/git-wipe.bash" \
    "$pkgdir/usr/share/bash-completion/completions/git-wipe"
  install -Dm644 "$out/completions/_git-wipe" \
    "$pkgdir/usr/share/zsh/site-functions/_git-wipe"
  install -Dm644 "$out/completions/git-wipe.fish" \
    "$pkgdir/usr/share/fish/vendor_completions.d/git-wipe.fish"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
