# Maintainer: VisorCraft LLC <packages@visorcraft.com>

pkgname=linsight
pkgver=1.20.5
pkgrel=2
pkgdesc='Fast Linux system-monitoring dashboard with multi-GPU support'
arch=('x86_64')
url='https://github.com/visorcraft/LinSight'
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-declarative' 'kirigami' 'hicolor-icon-theme')
makedepends=('cargo' 'qt6-tools' 'clang')
optdepends=('nvidia-utils: NVIDIA GPU monitoring via NVML')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9cc005bb63702dc72fb900dc1dcd4777f96cd537c68d79d2e1ff6af41146b0c7')

prepare() {
  cd "LinSight-$pkgver"
  export CARGO_HOME="$srcdir/cargo"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "LinSight-$pkgver"
  export CARGO_HOME="$srcdir/cargo"
  export CARGO_TARGET_DIR=target
  export CARGO_PROFILE_RELEASE_LTO=false
  QT_VERSION_MAJOR=6 cargo build --workspace --release --frozen
}

check() {
  cd "LinSight-$pkgver"
  export CARGO_HOME="$srcdir/cargo"
  export CARGO_TARGET_DIR=target
  export CARGO_PROFILE_RELEASE_LTO=false
  QT_VERSION_MAJOR=6 cargo test --workspace --release --frozen
}

package() {
  cd "LinSight-$pkgver"

  install -Dm755 target/release/linsight "$pkgdir/usr/bin/linsight"
  install -Dm755 target/release/linsightd "$pkgdir/usr/bin/linsightd"
  install -Dm755 target/release/linsight-cli "$pkgdir/usr/bin/linsight-cli"

  install -Dm644 packaging/com.visorcraft.LinSight.desktop \
    "$pkgdir/usr/share/applications/com.visorcraft.LinSight.desktop"
  install -Dm644 packaging/com.visorcraft.LinSight.metainfo.xml \
    "$pkgdir/usr/share/metainfo/com.visorcraft.LinSight.metainfo.xml"
  install -Dm644 packaging/systemd/linsight.service \
    "$pkgdir/usr/lib/systemd/user/linsight.service"
  install -Dm644 packaging/icons/scalable/apps/com.visorcraft.LinSight.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.visorcraft.LinSight.svg"

  local size
  for size in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 192x192 256x256 512x512; do
    install -Dm644 "packaging/icons/$size/apps/com.visorcraft.LinSight.png" \
      "$pkgdir/usr/share/icons/hicolor/$size/apps/com.visorcraft.LinSight.png"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -d "$pkgdir/usr/lib/linsight/plugins"
}
