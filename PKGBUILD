# Maintainer: Louis Dalibard <ontake@ontake.dev>
pkgname=ntsc-rs-gui-git
pkgver=0.7.3.r365.751279a
pkgrel=1
pkgdesc='ntsc-rs is a video effect which emulates NTSC and VHS video artifacts.'
arch=('x86_64' 'aarch64' 'armv7')
url=https://github.com/valadaptive/ntsc-rs
license=('GPL3')
depends=('gstreamer' 'gst-libav' 'gst-plugins-bad' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-ugly')
makedepends=('cargo' 'git' 'rust')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+$url.git" "ntsc-rs.desktop")
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd ${pkgname%-gui-git}
  cd crates/gui
  printf %s.r%s.%s $(grep ^version Cargo.toml|cut -d\" -f2) $(git rev-list --count HEAD) $(git describe --always)
}

build() {
  cd ${pkgname%-gui-git}
  cd crates/gui
  export CARGO_TARGET_DIR=target
  cargo build --release 
}

package() {
  cd ${pkgname%-gui-git}
  install -Dm644 assets/icon.svg "$pkgdir/usr/share/icons/hicolor/symbolic/apps/ntsc-rs.svg"
  install -Dm644 "../ntsc-rs.desktop" "$pkgdir/usr/share/applications/ntsc-rs.desktop"
  install -Dm755 crates/gui/target/release/${pkgname%-gui-git}-standalone "$pkgdir"/usr/bin/${pkgname%-git}
  install -Dm644 LICENSE-APACHE-2.0 "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-APACHE-2.0
  install -Dm644 LICENSE-ISC "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-ISC
  install -Dm644 LICENSE-MIT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-MIT
}
