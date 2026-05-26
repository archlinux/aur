# Maintainer: Daniel Head <archlinux at danhead dot me>

pkgname=playback-appimage
pkgver=1.10.0
pkgrel=1
pkgdesc="Playback software for Epilogue Operator devices"
arch=('x86_64')
url="https://www.epilogue.co"
license=('LicenseRef-proprietary')
depends=(
  'bash'
  'fuse2'
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'libglvnd'
  'libusb'
  'zlib'
)
options=(!strip)

_filename="Playback.AppImage"
_appimage="Playback-$pkgver.AppImage"
_squashfs_desktop_file="Playback.desktop"
_desktop_file="/usr/share/applications/playback.desktop"
_install_path="/opt/appimages/$_filename"

source=(
  "$_appimage::https://releases.epilogue.co/desktop/playback/$pkgver/release/linux/$_filename"
  "playback.sh"
  "60-gb-operator.rules"
)
sha512sums=('7180507f561916fc4596516d211da10eeacb62a8b9947eb0538c70d118f4c267fedef15787ef41eb9c262861a14ea21cd79cf36be894ce1d40009c00301cb945'
            '2ea22a28795914314d73b52fe94d0e7875b54ae3a1240c62f408c33e26f1a06099f273a7af43e439fe6259e7a4270d18f944f5aedfc5295bd1de4f3223ef4dad'
            'af2c3f33e02de571bebaa4ec9097922f78e9c5d27d7c308ae15a3387dfad39029b229e998ef2ad0759bfe40774121b690e6702082cbc544a29a9f10616bc282d')

prepare () {
  rm -rf ./squashfs-root
  chmod +x $_appimage
  ./$_appimage --appimage-extract "usr/share/icons/hicolor/*/apps/Playback.png" > /dev/null 2>&1
  ./$_appimage --appimage-extract "$_squashfs_desktop_file" > /dev/null 2>&1
  ./$_appimage --appimage-extract "usr/share/licenses/playback/LICENSE" > /dev/null 2>&1
}

package() {
  install -dm755 "$pkgdir/usr/share/icons"
  cp -dpr --no-preserve=ownership "squashfs-root/usr/share/icons" "$pkgdir/usr/share"
  chmod -R 755 "$pkgdir/usr/share/icons"
  find "$pkgdir/usr/share/icons" -type f -name "Playback.png" -exec chmod 644 {} \;

  # Patch desktop file to use wrapper script
  sed -i 's|Exec=Playback|Exec=playback|g' "squashfs-root/$_squashfs_desktop_file"

  install -Dm644 "squashfs-root/$_squashfs_desktop_file" "$pkgdir/$_desktop_file"
  install -Dm755 "$_appimage" "$pkgdir/$_install_path"

  # Install wrapper script (sets QT_QPA_PLATFORM=xcb for Wayland compatibility)
  install -Dm755 "playback.sh" "$pkgdir/usr/bin/playback"

  # Install udev rules for GB Operator device access
  install -Dm644 "60-gb-operator.rules" "$pkgdir/usr/lib/udev/rules.d/60-gb-operator.rules"

  # Install license
  install -Dm644 "squashfs-root/usr/share/licenses/playback/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
