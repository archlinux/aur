# Maintainer: tarball <bootctl@gmail.com>

pkgname=killport-jkfran
pkgver=0.9.1
pkgrel=1
pkgdesc='Easily kill processes running on a specified port'
arch=(aarch64 x86_64 i686 armv7h)
url='https://github.com/jkfran/killport'
license=(MIT)
depends=(gcc-libs)
makedepends=(cargo)
provides=(killport)
conflicts=(killport)
source=("killport-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f1efcce989196417dd71e12fcf72550d135d7dbf5cffb4a96278f603f0695b36')

prepare() {
  export RUSTUP_TOOLCHAIN=stable

  cd "killport-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cd "killport-$pkgver"
  cargo build --frozen --release --all-features
}

check() {
  export RUSTUP_TOOLCHAIN=stable

  cd "killport-$pkgver"
  cargo test --frozen --all-features

  [[ "$(./target/release/killport --version)" == "killport $pkgver" ]]
}

package() {
  cd "killport-$pkgver"

  install -Dm755 target/release/killport -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/killport"
}
