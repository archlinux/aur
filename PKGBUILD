# Maintainer: MLM-stuff <gfxoxinzh@mozmail.com>
pkgname=retorrent
pkgver=0.2.10
pkgrel=1
pkgdesc="A BitTorrent client with an alpha/test UI, built in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/mlm-games/retorrent"
license=('AGPL3')
depends=('gtk3' 'glibc')
optdepends=('libappindicator-gtk3: system tray icon')
makedepends=('cargo' 'rust' 'pkg-config')
provides=('retorrent')
conflicts=('retorrent-bin')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mlm-games/retorrent/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release --locked --features desktop-bin
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "target/release/retorrent" "${pkgdir}/usr/bin/retorrent"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/retorrent.desktop" << DESKTOP_EOF
[Desktop Entry]
Name=Retorrent
Comment=A semi-modern BitTorrent client
Exec=retorrent %U
Icon=retorrent
Terminal=false
Type=Application
Categories=Network;FileTransfer;P2P;
MimeType=application/x-bittorrent;x-scheme-handler/magnet;
StartupWMClass=retorrent
StartupNotify=true
DESKTOP_EOF

  install -Dm644 "fastlane/metadata/android/en-US/images/icon.png" \
    "${pkgdir}/usr/share/pixmaps/retorrent.png"
  install -Dm644 "fastlane/metadata/android/en-US/images/icon.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/retorrent.png"
}
