# Maintainer: Burgess Leo <liuxiaopeng731@gmail.com>
pkgname=leolock
pkgver=1.0.0
pkgrel=1
pkgdesc="LeoLock - 安全的文件加密解密工具"
arch=('x86_64')
url="https://github.com/lxp731/leolock"
license=('MIT')
depends=('glibc')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz")
sha256sums=('3211d41cd8bcb050cc41e8c1f35693e98ecdd89d8b78ffaecc6981dfbe3df20b')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
  
  # 生成 shell 补全文件
  mkdir -p completions
  ./target/release/leolock completions bash > completions/leolock.bash 2>/dev/null || true
  ./target/release/leolock completions zsh > completions/_leolock 2>/dev/null || true
  ./target/release/leolock completions fish > completions/leolock.fish 2>/dev/null || true
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  
  # 安装二进制文件
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  
  # 安装 shell 补全文件（如果生成成功）
  if [[ -f "completions/_leolock" ]]; then
    install -Dm644 "completions/_leolock" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
  fi
  if [[ -f "completions/leolock.bash" ]]; then
    install -Dm644 "completions/leolock.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  fi
  if [[ -f "completions/leolock.fish" ]]; then
    install -Dm644 "completions/leolock.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
  fi
  
  # 安装许可证
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # 安装文档
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 README-en.md "$pkgdir/usr/share/doc/$pkgname/README-en.md"
}