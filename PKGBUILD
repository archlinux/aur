# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor:  Po-An,Yang(Antonio) <yanganto gmail.com>

pkgname=clipcat
pkgver=0.16.2
pkgrel=2
pkgdesc="A clipboard manager written in Rust Programming Language"
arch=(x86_64)
url="https://github.com/xrelkd/clipcat"
license=(GPL-3.0-only)
depends=(
  gcc-libs
  glibc
)
makedepends=(
  cargo
  libgit2
  protobuf
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e784ec4a3799fa003e2d298477d8a627d1e02fdb147136fb245fdf87d34b96d3')

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_archive"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features

  for cmd in clipcatd clipcatctl clipcat-menu clipcat-notify; do
    "target/release/$cmd" completions bash > "$cmd.bash"
    "target/release/$cmd" completions zsh > "$cmd.zsh"
    "target/release/$cmd" completions fish > "$cmd.fish"
  done
}

check() {
  cd "$_archive"

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features -- \
    --skip test_x11_clipboard \
    --skip test_x11_primary
}

package() {
  cd "$_archive"

  install -Dm755 -t "$pkgdir/usr/bin" \
    target/release/clipcat-menu \
    target/release/clipcat-notify \
    target/release/clipcatctl \
    target/release/clipcatd

  for cmd in clipcatd clipcatctl clipcat-menu clipcat-notify; do
    install -Dm644 "$cmd.bash" "$pkgdir/usr/share/bash-completion/completions/$cmd"
    install -Dm644 "$cmd.zsh" "$pkgdir/usr/share/zsh/site-functions/_$cmd"
    install -Dm644 "$cmd.fish" "$pkgdir/usr/share/fish/completions/$cmd.fish"
  done

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
}
