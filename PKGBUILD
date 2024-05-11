# Maintainer: Attila Fidan <archlinux-buildsystem@print0.net>

pkgname=panamax-git
_gitname=${pkgname%-git}
pkgver=r194.2024b5b
pkgrel=1

pkgdesc="Mirror rustup and crates.io repositories, for offline Rust and cargo usage"
url="https://github.com/panamax-rs/panamax"
license=("Apache-2.0 AND MIT")
arch=(x86_64)

depends=(git)
makedepends=(cargo)

provides=("panamax=$pkgver")
conflicts=(panamax)

source=("git+$url.git")
b2sums=(SKIP)

prepare() {
  cd "$_gitname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$_gitname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$_gitname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$_gitname"
  install -Dm0755 "target/release/panamax" -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE-APACHE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname/"
}
