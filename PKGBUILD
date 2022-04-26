# Maintainer: Funami
pkgname=cargo-clone
pkgver=1.0.1
pkgrel=1
pkgdesc="A cargo subcommand to fetch the source code of a Rust crate"
arch=('x86_64')
url="https://github.com/JanLikar/cargo-clone"
license=('APACHE' 'MIT')
depends=('libgit2' 'curl')
makedepends=('cargo' 'libssh2')
source=("https://github.com/JanLikar/cargo-clone/archive/v$pkgver.tar.gz"
        'cargo_lock.patch')
sha256sums=('7aa873ab3e13b70e979905e268a35410827b530667996c5c0a427dbfafd78784'
            'd1d3062a225b87482d787aec2d097ecea7eca82478c6994c7ea60c178d58c66f')

prepare() {
  cd "$pkgname-$pkgver"
  patch --forward --strip=1 --input="$srcdir/cargo_lock.patch"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export LIBSSH2_SYS_USE_PKG_CONFIG=1
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
}
