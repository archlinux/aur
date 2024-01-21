# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Thomas <thomas at 6f dot io>

pkgname=jujutsu
_pkgname=jj
pkgver=0.13.0
pkgrel=1
pkgdesc="Git-compatible VCS that is both simple and powerful"
arch=(x86_64)
url="https://github.com/martinvonz/jj"
license=(Apache-2.0)
depends=(
  gcc-libs
  glibc
  libgit2
)
makedepends=(cargo)
options=(!lto)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f4e2be834cf9ea966ac58451298c8f1eed145c190fbca62b5b5a6bd145ac997e')

_archive="$_pkgname-$pkgver"

prepare() {
  cd "$_archive"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_archive"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features --package jj-cli

  target/release/jj util completion --bash > jj.bash
  target/release/jj util completion --zsh > jj.zsh
  target/release/jj util completion --fish > jj.fish
}

check() {
  cd "$_archive"

  # Trick to reduce the size of the target directory during test compilation.
  # A lot of space is still required, around 10 GB.
  mkdir -p .cargo
  {
    echo '[profile.dev]'
    echo 'split-debuginfo = "unpacked"'
  } > .cargo/config.toml

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features --package jj-cli
}

package() {
  cd "$_archive"

  install -Dm755 -t "$pkgdir/usr/bin" target/release/jj

  install -Dm644 jj.bash "$pkgdir/usr/share/bash-completion/completions/jj"
  install -Dm644 jj.zsh "$pkgdir/usr/share/zsh/site-functions/_jj"
  install -Dm644 jj.fish "$pkgdir/usr/share/fish/completions/jj.fish"

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  cp --archive ./docs/* "$pkgdir/usr/share/doc/$pkgname"
}
