# Maintainer: Sthn
#
# This is a community-maintained Linux (AUR) port of Mineradio,
# originally created by XxHuberrr for Windows.
# Upstream: https://github.com/XxHuberrr/Mineradio
# Licensed under GPL-3.0. The Linux packaging patches (platform-specific
# GPU switches, icon format, cache paths) are maintained by the AUR submitter.
# All visual design, branding, and core code belong to the original author.

pkgname=mineradio
pkgver=1.1.1
pkgrel=6
pkgdesc='Immersive music player with cinematic visuals, particle effects, and lyrics stage (Linux port by Sthn)'
arch=('x86_64')
url='https://github.com/XxHuberrr/Mineradio'
license=('GPL-3.0-only')
depends=(
  'gtk3'
  'libxss'
  'nss'
  'alsa-lib'
  'mpg123'
  'ffmpeg'
  'xdg-utils'
)
makedepends=(
  'nodejs'
  'npm'
  'git'
)
provides=('mineradio')
conflicts=('mineradio-git')
install=mineradio.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/XxHuberrr/Mineradio/archive/refs/tags/v$pkgver.tar.gz"
        'mineradio.desktop'
        'mineradio.sh')
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

build() {
  cd "$srcdir/Mineradio-$pkgver"

  # Fix 1: Use icon.png on Linux instead of icon.ico
  sed -i "s|const APP_ICON_ICO = path.join(__dirname, '..', 'build', 'icon.ico');|const APP_ICON_ICO = path.join(__dirname, '..', 'build', process.platform === 'win32' ? 'icon.ico' : 'icon.png');|" desktop/main.js

  # Fix 2: Replace Windows-only GPU switches with Linux-compatible ones
  # Find the CHROMIUM_PERFORMANCE_SWITCHES block and rewrite it
  python3 -c "
import re, sys
with open('desktop/main.js', 'r') as f:
    content = f.read()

old = '''const CHROMIUM_PERFORMANCE_SWITCHES = [
  ['autoplay-policy', 'no-user-gesture-required'],
  ['ignore-gpu-blocklist'],
  ['enable-gpu-rasterization'],
  ['enable-oop-rasterization'],
  ['enable-zero-copy'],
  ['enable-accelerated-2d-canvas'],
  ['disable-background-timer-throttling'],
  ['disable-renderer-backgrounding'],
  ['disable-backgrounding-occluded-windows'],
  ['force_high_performance_gpu'],
  ['use-angle', 'd3d11'],
];'''

new = '''const CHROMIUM_PERFORMANCE_SWITCHES = [
  ['autoplay-policy', 'no-user-gesture-required'],
  ...(process.platform === 'win32' ? [
    ['ignore-gpu-blocklist'],
    ['enable-gpu-rasterization'],
    ['enable-oop-rasterization'],
    ['enable-zero-copy'],
    ['enable-accelerated-2d-canvas'],
    ['force_high_performance_gpu'],
    ['use-angle', 'd3d11'],
  ] : [
    ['disable-gpu'],
    ['disable-software-rasterizer'],
    ['in-process-gpu'],
  ]),
  ['disable-background-timer-throttling'],
  ['disable-renderer-backgrounding'],
  ['disable-backgrounding-occluded-windows'],
];'''

content = content.replace(old, new)
with open('desktop/main.js', 'w') as f:
    f.write(content)
"

  # Fix 3: Fix beatmap cache path for Linux
  sed -i "s|const BEATMAP_CACHE_DIR = process.env.MINERADIO_BEAT_CACHE_DIR || 'D:\\\\\\\\MineradioCache\\\\\\\\beatmaps';|const BEATMAP_CACHE_DIR = process.env.MINERADIO_BEAT_CACHE_DIR || (process.platform === 'win32' ? 'D:\\\\\\\\MineradioCache\\\\\\\\beatmaps' : path.join(require('os').homedir(), '.cache', 'Mineradio', 'beatmaps'));|" server.js

  # Install npm dependencies (including devDependencies for electron-builder)
  npm install --prefer-offline

  # Build Linux directory (unpacked, no AppImage/FUSE)
  npx electron-builder --linux dir
}

package() {
  cd "$srcdir/Mineradio-$pkgver"

  # Install the unpacked electron app to /opt/mineradio
  install -dm755 "$pkgdir/opt/mineradio"
  cp -r dist/linux-unpacked/* "$pkgdir/opt/mineradio/"

  # Make the wrapper script executable and install it
  install -Dm755 "$srcdir/mineradio.sh" "$pkgdir/usr/bin/mineradio"

  # Install desktop file
  install -Dm644 "$srcdir/mineradio.desktop" "$pkgdir/usr/share/applications/mineradio.desktop"

  # Install icon
  install -Dm644 build/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/mineradio.png"
}
