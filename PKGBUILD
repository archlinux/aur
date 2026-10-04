# Maintainer: Bernardo Gomes <bernardopg@users.noreply.github.com>
pkgname=wingdrive-bin
pkgver=2.0.0alpha6
pkgrel=1
pkgdesc='WingDrive desktop file manager'
arch=('x86_64')
url='https://github.com/bernardopg/wingdrive'
license=('LicenseRef-FSL-1.1-ALv2' 'GPL-3.0-only')
depends=('glibc' 'gtk3' 'webkit2gtk-4.1' 'xdotool' 'xdg-utils' 'alsa-lib' 'libpipewire' 'jack' 'libva')
provides=('wingdrive')
conflicts=('wingdrive')
options=('!strip')
_upstream_version=2.0.0-alpha.6
source=("WingDrive-2.0.0-alpha.6-x86_64.AppImage::https://github.com/bernardopg/wingdrive/releases/download/v${_upstream_version}/WingDrive-2.0.0-alpha.6-x86_64.AppImage"
        "LICENSE::https://github.com/bernardopg/wingdrive/releases/download/v${_upstream_version}/LICENSE")
sha256sums=('8ddd18ce381c10f3e8f5c72dacd16260d8a7ccacd4ac83547ce1b974adb86577' '24e941b64ab9f59b5a7ca1bafb27bd25e550d7d9461c5890482443f5b19b50b8')

prepare() {
  chmod +x "WingDrive-2.0.0-alpha.6-x86_64.AppImage"
  "./WingDrive-2.0.0-alpha.6-x86_64.AppImage" --appimage-extract > /dev/null
  find squashfs-root -type d -exec chmod 755 {} +
}

package() {
  install -d "$pkgdir/opt/wingdrive" "$pkgdir/usr/bin"
  cp -a squashfs-root/. "$pkgdir/opt/wingdrive/"
  cat > "$pkgdir/usr/bin/wingdrive" <<'WRAPPER'
#!/bin/sh
export APPDIR=/opt/wingdrive
exec "$APPDIR/AppRun" "$@"
WRAPPER
  chmod 755 "$pkgdir/usr/bin/wingdrive"
  install -Dm644 squashfs-root/usr/share/applications/*.desktop "$pkgdir/usr/share/applications/wingdrive.desktop"
  sed -i 's|^Exec=.*|Exec=wingdrive %U|; s|^TryExec=.*|TryExec=wingdrive|' "$pkgdir/usr/share/applications/wingdrive.desktop"
  if [[ -d squashfs-root/usr/share/icons ]]; then
    install -d "$pkgdir/usr/share/icons"
    cp -a squashfs-root/usr/share/icons/. "$pkgdir/usr/share/icons/"
  fi
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 squashfs-root/usr/lib/WingDrive/NOTICE.md "$pkgdir/usr/share/licenses/$pkgname/NOTICE.md"
    cp -a squashfs-root/usr/lib/WingDrive/licenses/. "$pkgdir/usr/share/licenses/$pkgname/"
}
