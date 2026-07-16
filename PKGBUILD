# Maintainer: Mitkomm <Mitkomm at proton dot me>

pkgname=cubiclauncher
pkgver=31.0.0
pkgrel=1
pkgdesc="Open-source Minecraft launcher"
arch=('x86_64')
license=('GPL-3.0-only')
url='https://github.com/CubicLauncherDevs/CubicLauncher'
depends=(
  'webkit2gtk-4.1'
  'libsoup3'
  'gtk3'
  'gstreamer'
  'gst-plugins-base'
  'gst-plugins-good'
  'gst-plugins-bad'
  'gst-libav'
  'libglvnd'
  'mesa'
  'zstd'
  'openssl'
)
makedepends=(
  'cargo'
  'bun'
  'pkgconf'
  'base-devel'
  'git'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/CubicLauncherDevs/CubicLauncher/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1c04437cce4a37c81a033fd99993bc7faf7535f437648ee7b0bd60672e07bc63')

options=(!lto)

build() {
  cd "$srcdir/CubicLauncher-$pkgver"

  bun install
  bun run tauri build --no-bundle
}

package() {
  cd "$srcdir/CubicLauncher-$pkgver"

  install -Dm755 \
    target/release/cubiclauncher \
    "$pkgdir/usr/bin/cubiclauncher"

  install -Dm644 \
    src-tauri/icons/32x32.png \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/cubiclauncher.png"

  install -Dm644 \
    src-tauri/icons/128x128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/cubiclauncher.png"

  install -Dm644 \
    src-tauri/icons/128x128@2x.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/cubiclauncher.png"

  install -Dm644 \
    src-tauri/icons/icon.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/cubiclauncher.png"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/cubiclauncher.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=CubicLauncher
Comment=Open source Minecraft launcher
Exec=/usr/bin/cubiclauncher
Icon=cubiclauncher
Terminal=false
Categories=Game;
StartupWMClass=cubiclauncher
EOF

  install -Dm644 \
    LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
