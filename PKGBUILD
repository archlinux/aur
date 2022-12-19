# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: quininer

pkgname=ruffle-git
pkgver=r7815.96950f424
pkgrel=1
epoch=1
pkgdesc="A Flash Player emulator written in Rust"
arch=(x86_64)
url="https://ruffle.rs/"
license=(Apache MIT)
depends=(alsa-lib libxcb  gtk3)
makedepends=(git cargo python jdk-openjdk at-spi2-core)
provides=(ruffle)
conflicts=(ruffle)
source=("git+https://github.com/ruffle-rs/ruffle.git")
sha256sums=('SKIP')
options=(!lto)

pkgver() {
  cd "ruffle/desktop"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "ruffle/desktop"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build(){
  cd "ruffle/desktop"
  cargo build --frozen --release --all-features
}

package() {
  cd ruffle
  install -D -m755 "target/release/ruffle_desktop" "$pkgdir/usr/bin/ruffle"
  install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"

  for s in 16x16 32x32 128x128 256x256 512x512; do
    install -Dm0644 "desktop/assets/Assets.xcassets/RuffleMacIcon.iconset/icon_$s.png" "${pkgdir}/usr/share/icons/hicolor/$s/apps/ruffle.png"
  done

  install -d "${pkgdir}/usr/share/applications/"
 cat > "${pkgdir}/usr/share/applications/ruffle.desktop" << _EOD
[Desktop Entry]
Type=Application
Name=Ruffle
GenericName=Ruffle
Comment=Player for using content created on the Adobe Flash platform
Exec=ruffle
Icon=ruffle
Terminal=false
StartupNotify=false
Categories=Audio;AudioVideo;Graphics;GTK;Player;Video;Viewer;
MimeType=application/x-shockwave-flash;
_EOD
}
