# Maintainer: Vendetta1871 <conqueror.v.v.v.v.v@gmail.com>
pkgname=nvtray
pkgver=0.3.0
pkgrel=1
pkgdesc="NVIDIA GPU activity tray icon (StatusNotifierItem), like the classic Windows GPU Activity icon"
arch=('x86_64')
url="https://github.com/Vendetta1871/nvtray"
license=('GPL-3.0-or-later')
depends=('nvidia-utils')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "nvtray.desktop")
sha256sums=('6a44d2d5ad827ca2e6691875c0b43f1626048494c66b975b772ca5889dc1f690'
            '7427c232b00876f6b5eb8ca5d26e4c2e2b7e4c09f5c8c4c66837836c85335dcd')

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
  install -Dm0755 "target/release/nvtray" -t "$pkgdir/usr/bin/"
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm0644 "$srcdir/nvtray.desktop" -t "$pkgdir/usr/share/applications/"
}
