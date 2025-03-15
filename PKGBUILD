# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Fabrizio Pietrucci <bamlessnty5@gmail.com>
# Contributor: Zhiwei Chen <condy0919@gmail.com>

pkgname=hotspot-appimage
pkgver=1.5.1
pkgrel=2
pkgdesc="The Linux perf GUI for performance analysis (AppImage release)"
url="https://github.com/KDAB/hotspot"
license=('GPL-2.0-only')
arch=('x86_64')
depends=('fuse2')
provides=("hotspot")
conflicts=("hotspot")
options=('!strip')
_appimage="hotspot-v$pkgver-x86_64.AppImage"
source=("$url/releases/download/v$pkgver/$_appimage")
sha256sums=('ce60db8f571b5b41ca5bc5417054558c5f7fd6e5801a47cf9390f3b888fcd297')

prepare() {
# Extract the AppImage
  chmod +x "$_appimage"
  ./"$_appimage" --appimage-extract
  chmod 755 squashfs-root
# Create an exec file with an environment variable that disables AppImageLauncher integration
  echo -e "#!/bin/sh\n\
env APPIMAGELAUNCHER_DISABLE=true /opt/hotspot/hotspot" > hotspot
}

package() {
  cd squashfs-root
  for i in 16x16 22x22 32x32 48x48 64x64 512x512; do
    install -Dm644 usr/share/icons/hicolor/$i/apps/hotspot.png "$pkgdir/usr/share/icons/hicolor/$i/apps/hotspot.png"
  done
  install -Dm644 usr/share/applications/com.kdab.hotspot.desktop "$pkgdir/usr/share/applications/hotspot.desktop"
  cd "$srcdir"
  install -Dm755 $_appimage "$pkgdir/opt/hotspot/hotspot"
  install -Dm755 hotspot -t "$pkgdir/usr/bin"
}
