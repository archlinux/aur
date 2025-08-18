# Maintainer: Glucy2 <glucy-2@outlook.com>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

pkgname=bash-pinyin-completion-rs
_tagname=0.3.0
pkgver=0.3.0
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
sha256sums=('9c7a5a0f4c4ca29953461fa159c5fa832a490c1198085bf433ee0c8cbf7b5b09')

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
