# Maintainer: tarball <bootctl@gmail.com>

pkgname=killport-jkfran
pkgver=0.9.2
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
sha256sums=('d1a500b1700775a5e24754e2b1f29cde0ad5ad72776b6abe1973173a1a9507b8')

prepare() {
  export RUSTUP_TOOLCHAIN=stable

  cd "killport-$pkgver"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
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
