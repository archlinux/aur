# Maintainer: tarball <bootctl@gmail.com>

pkgname=music-player
pkgver=0.2.0_alpha.12
pkgrel=1
pkgdesc='An extensible music server written in Rust'
url='https://github.com/tsirysndr/music-player'
arch=(x86_64 aarch64)
license=(MIT)
depends=(glibc alsa-lib gcc-libs)
makedepends=(cargo nodejs yarn)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver/_/-}.tar.gz"
  $pkgname.service
)
b2sums=('71a3ea25c0905b01b5a66c116cf9d8dbe947cd16b3a7e0dfb438a36d2d063f78f52407fd3e39d261319d8eb135b23094d598e094e98b79bb7ec29bfc93aedecc'
        'd9924b8f0fcd2106d51b6e07c1bf40ab734ba24e0ebec4d697775e56305a252489469e4a634f4d967508decc0f556ebe425896aca0eb791c9813f60b1d239703')

prepare() {
  export RUSTUP_TOOLCHAIN=stable

  cd $pkgname-${pkgver/_/-}
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"

  cd webui/musicplayer
  yarn install
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cd $pkgname-${pkgver/_/-}/webui/musicplayer
  yarn build

  cd ../..
  cargo build --frozen --release --all-features
}

package() {
  cd $pkgname-${pkgver/_/-}

  install -Dm755 target/release/$pkgname \
    "$pkgdir"/usr/bin/$pkgname

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 "$srcdir"/$pkgname.service \
    "$pkgdir"/usr/lib/systemd/user/$pkgname.service
}
