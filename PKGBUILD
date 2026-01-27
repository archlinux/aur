 # Maintainer: Alex Fler <alex@fler.biz>
  pkgname=certradar-cli
  pkgver=0.1.0
  pkgrel=1
  pkgdesc="Certificate transparency search and SSL/TLS security analysis CLI"
  arch=('x86_64')
  url="https://github.com/FlerAlex/certradar-cli"
  license=('MIT')
  depends=('gcc-libs' 'openssl')
  makedepends=('cargo' 'clang' 'make')
  source=("$pkgname-$pkgver.tar.gz::https://github.com/FlerAlex/certradar-cli/archive/refs/tags/v$pkgver.tar.gz")
  sha256sums=('SKIP')

  prepare() {
      cd "$pkgname-$pkgver"
      export RUSTUP_TOOLCHAIN=stable
      cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  }

  build() {
      cd "$pkgname-$pkgver"
      export RUSTUP_TOOLCHAIN=stable
      export CARGO_TARGET_DIR=target
      export OPENSSL_NO_VENDOR=1
      export CC=clang
      cargo build --frozen --release
  }

  package() {
      cd "$pkgname-$pkgver"
      install -Dm755 "target/release/certradar-cli" "$pkgdir/usr/bin/certradar-cli"
      install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  }
