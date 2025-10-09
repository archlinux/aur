# Maintainer: Glucy2 <glucy-2@outlook.com>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

pkgname=bash-pinyin-completion-rs
_tagname=1.0.0-beta
pkgver=1.0.0beta
pkgrel=1
pkgdesc="Simple completion script for pinyin, written in rust."
arch=(
  'i686'
  'x86_64'
  'armv6h'
  'armv7h'
  'aarch64'
  'loongarch64'
  'mips64'
  'mips64el'
  'riscv64'
)
url="https://github.com/AOSC-Dev/bash-pinyin-completion-rs"
license=('GPL-3.0-only')
depends=('bash' 'bash-completion' 'glibc' 'gcc-libs')
makedepends=('cargo')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$_tagname.tar.gz")
sha256sums=('0a1cc14018598be481713ca84d2c78fd9967d9009a9f826f70f8536a334a4590')

prepare() {
  cd "$pkgname-$_tagname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$_tagname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$_tagname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$_tagname"
  install -Dm755 -t "$pkgdir/usr/bin" target/release/bash-pinyin-completion-rs
  install -Dm644 -t "$pkgdir/usr/share/$pkgname" scripts/bash_pinyin_completion
}
