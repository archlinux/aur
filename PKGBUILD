# Maintainer: Anıl Akpınar <4ni1ak@gmail.com>
pkgname=openlogi
pkgver=0.8.13
pkgrel=1
pkgdesc="Local-first companion for Logitech HID++ peripherals (native alternative to Logitech Options+)"
arch=('x86_64' 'aarch64')
url="https://github.com/AprilNEA/OpenLogi"
license=('MIT' 'Apache-2.0')
depends=('fontconfig' 'freetype2' 'libglvnd' 'libxkbcommon' 'libxkbcommon-x11' 'wayland' 'vulkan-icd-loader' 'libxcb' 'systemd-libs' 'hicolor-icon-theme')
makedepends=('cargo' 'clang' 'pkgconf' 'git')
provides=('openlogi')
conflicts=('openlogi-bin')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AprilNEA/OpenLogi/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('75cf9da70b9c99b1ada1cbf4c007fc1a7d069967520b3ec250a6604326d5c8e0')

prepare() {
  cd "OpenLogi-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "OpenLogi-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen \
    --package=openlogi --bin=openlogi \
    --package=openlogi-agent --bin=openlogi-agent \
    --package=openlogi-desktop --bin=openlogi-desktop \
    --package=openlogi-overlay --bin=openlogi-overlay
}

check() {
  cd "OpenLogi-$pkgver"
  cargo test --release --frozen --workspace --exclude=openlogi-desktop
}

package() {
  cd "OpenLogi-$pkgver"
  for binary in openlogi openlogi-agent openlogi-desktop openlogi-overlay; do
    install -Dm755 "target/release/$binary" "$pkgdir/usr/bin/$binary"
  done

  install -Dm644 packaging/linux/desktop/openlogi.desktop \
    "$pkgdir/usr/share/applications/openlogi.desktop"

  install -Dm644 design/icon/openlogi.png \
    "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/openlogi.png"
  for size in 512 256 128 64 48 32 16; do
    install -Dm644 "design/icon/openlogi-$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/openlogi.png"
  done

  install -Dm644 packaging/linux/udev/70-openlogi.rules \
    "$pkgdir/usr/lib/udev/rules.d/70-openlogi.rules"

  install -Dm644 packaging/linux/systemd/openlogi-agent.service \
    "$pkgdir/usr/lib/systemd/user/openlogi-agent.service"

  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
