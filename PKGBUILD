# Maintainer: Edwar Diaz <edwardiaz.dev@gmail.com>

pkgname=cliprithm-bin
pkgver=1.6.1
pkgrel=1
pkgdesc="Prebuilt Cliprithm AppImage packaged for Arch Linux"
arch=('x86_64')
url="https://github.com/BOTOOM/Cliprithm"
license=('MIT')
depends=('ffmpeg' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libayatana-appindicator' 'webkit2gtk-4.1')
optdepends=('xdg-desktop-portal: improved desktop integration for file dialogs and portals')
provides=('cliprithm')
conflicts=('cliprithm')
source=("cliprithm_1.6.1_amd64.deb::https://github.com/BOTOOM/Cliprithm/releases/download/cliprithm-v1.6.1/cliprithm_1.6.1_amd64.deb" "cliprithm.png::https://raw.githubusercontent.com/BOTOOM/Cliprithm/cliprithm-v1.6.1/src-tauri/icons/128x128.png" "LICENSE::https://raw.githubusercontent.com/BOTOOM/Cliprithm/cliprithm-v1.6.1/LICENSE" "cliprithm" "cliprithm.desktop")
sha256sums=('6045310cb94a4a2830449bc9e19997f9c9b46a2c3fa412ea4fd0ad0e9d60d921' 'c7f874d897675e666ae09da79dfefeed2aa5bf9f51da33bf931050c5087b6a80' 'd90660ef692577f22ad72ccabe19ff6d10c4047d5a8345bf748f0c044932b52c' '3c17eb114fb4bbe061f41a80acae4c03439c36f7a9379d2e6907649ebf3f45e1' 'fc1f073620a6ea5283c288a5870941eea57dc2369b691c0788ec8fb16260045f')
options=('!strip')

package() {
  # Extract the .deb file
  bsdtar -xf "$srcdir/cliprithm_1.6.1_amd64.deb" -C "$srcdir" data.tar.gz || bsdtar -xf "$srcdir/cliprithm_1.6.1_amd64.deb" -C "$srcdir" data.tar.xz

  # Extract the data archive directly into the pkgdir
  if [ -f "$srcdir/data.tar.gz" ]; then
    bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir/"
  elif [ -f "$srcdir/data.tar.xz" ]; then
    bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"
  fi

  # The upstream .deb bundles FFmpeg sidecars at paths owned by Arch's
  # ffmpeg package. Use the user's system-managed binaries instead.
  rm -f "$pkgdir/usr/bin/ffmpeg" "$pkgdir/usr/bin/ffprobe"

  # Clean up the extracted deb directories we don't need or want to overwrite
  rm -rf "$pkgdir/usr/share/applications/cliprithm.desktop"
  rm -rf "$pkgdir/usr/share/applications/Cliprithm.desktop"

  # Install our custom launcher, icon, and desktop file
  install -Dm644 "$srcdir/cliprithm.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/cliprithm.png"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Move the native binary extracted from deb to avoid conflicts with our wrapper
  if [ -f "$pkgdir/usr/bin/cliprithm" ]; then
     mv "$pkgdir/usr/bin/cliprithm" "$pkgdir/usr/bin/cliprithm-bin"
  fi

  # Install our custom launcher
  install -Dm755 "$srcdir/cliprithm" "$pkgdir/usr/bin/cliprithm"
  install -Dm644 "$srcdir/cliprithm.desktop" "$pkgdir/usr/share/applications/cliprithm.desktop"
}
