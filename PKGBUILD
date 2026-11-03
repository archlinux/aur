# Maintainer: rotko <hq@rotko.net>
pkgname=codj
pkgver=0.2.1
pkgrel=1
pkgdesc="Vim-style terminal music player and keyboard DJ (TUI for codjd)"
arch=('x86_64' 'aarch64')
url="https://github.com/hitchho/codj"
license=('GPL-3.0-or-later')
depends=('codjd' 'luajit' 'gcc-libs' 'glibc')
makedepends=('cargo' 'pkgconf')
# reqwest's rustls pulls in ring; makepkg's -flto in CFLAGS breaks its C objects at link time.
# The crate's release profile does its own LTO.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hitchho/codj/archive/v$pkgver.tar.gz")
sha256sums=('0d7ff8e373017fd35e36cfb195e08173046683dab0837d40c85b28fcfd2b65df')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/codj -t "$pkgdir/usr/bin/"
  install -Dm644 LICENCE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md DOCS.md config.example.toml -t "$pkgdir/usr/share/doc/$pkgname/"
  cp -r examples "$pkgdir/usr/share/doc/$pkgname/examples"
}
