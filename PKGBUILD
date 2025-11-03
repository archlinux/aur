# Maintainer: Glucy2 <glucy-2@outlook.com>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

pkgname=bash-pinyin-completion-rs
_tagname=1.0.1
pkgver=1.0.1
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
sha256sums=('2618df1e43dd027366f285ccb4635778b05c653dcca2554fce40ee36b19176e8')

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
