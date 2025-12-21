# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=fluvio
pkgver=0.18.1
pkgrel=1
pkgdesc='event stream processing for developers to collect and transform data in motion to power responsive data intensive applications'
url="https://www.fluvio.io/"
license=('Apache-2.0')
makedepends=('cargo' 'git')
depends=(
  gcc-libs
  glibc
)
arch=('x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fluvio-community/fluvio/archive/v${pkgver}.tar.gz")
options=("!lto" "!debug")

prepare() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
  cd "$pkgname-$pkgver"

  export CARGO_TARGET_DIR=target
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release --all-features
}

package() {
  find "$pkgname-$pkgver"/target/release \
      -maxdepth 1 \
      -executable \
      -type f \
      -exec install -Dm0755 -t "$pkgdir/opt/fluvio/bin/" {} +

  mkdir -p "$pkgdir/usr/bin"
  ln -s "../../../opt/fluvio/bin/fluvio" "$pkgdir/usr/bin/fluvio"
}

sha256sums=('61f204785b1a7c790729166ed3a61a1a78970ebd3a44f615d5be29885b746186')
