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
pkgrel=2
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
        'mineradio.sh'
        'linux-compat.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

build() {
  cd "$srcdir/Mineradio-$pkgver"

  # Apply Linux compatibility patches
  patch -p1 < "$srcdir/linux-compat.patch"

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
