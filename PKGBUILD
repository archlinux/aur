# Maintainer: Ly-sec <itslysec@gmail.com>
pkgname=noctalia
pkgver=0.1.2
pkgrel=1
pkgdesc="A simple CLI for installing and updating noctalia-shell"
arch=('x86_64' 'aarch64')
url="https://github.com/noctalia-dev/noctalia-cli"
license=('MIT' 'Apache')
depends=('glibc' 'gcc-libs')
makedepends=('cargo' 'git' 'clang')  # Added clang
source=("$pkgname-$pkgver.tar.gz::https://github.com/noctalia-dev/noctalia-cli/archive/v$pkgver.tar.gz")
sha256sums=('b18a66907fe80ce5939f79ccb0b381c80663ee7aad6e5324578948fb2b91aef9')

prepare() {
  cd "$srcdir/noctalia-cli-$pkgver"
  cargo fetch --locked
}

build() {
  cd "$srcdir/noctalia-cli-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Ensure ring can find the C compiler
  export CC=clang
  export CXX=clang++
  cargo build --frozen --release
}

check() {
  cd "$srcdir/noctalia-cli-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$srcdir/noctalia-cli-$pkgver"
  install -Dm755 "target/release/noctalia" "$pkgdir/usr/bin/noctalia"
  
  # Install license if it exists
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  elif [ -f LICENSE-MIT ]; then
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  elif [ -f LICENSE-APACHE ]; then
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  fi
}
