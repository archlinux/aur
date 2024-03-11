# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Artorias
# Contributor: Gustavo Chain <me@qustavo.cc>
# Contributor: zxp19821005 <zxp19821005 at 163 dot com>

pkgname=notesnook-bin
pkgdesc="A fully open source & end-to-end encrypted note taking alternative to Evernote (binary release)"
pkgver=2.6.16
pkgrel=1
url="https://github.com/streetwriters/notesnook"
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')
depends=('alsa-lib' 'libappindicator-gtk3' 'libnotify' 'libsodium' 'libxss' 'libxtst' 'mesa' 'nss')
makedepends=('fuse2')
provides=("notesnook")
conflicts=("notesnook")
_appimage="notesnook_linux_$CARCH-$pkgver.AppImage"
source_x86_64=("$_appimage::$url/releases/download/v$pkgver/notesnook_linux_x86_64.AppImage")
source_aarch64=("$_appimage::$url/releases/download/v$pkgver/notesnook_linux_arm64.AppImage")
sha256sums_x86_64=('455eb0f715e76b840291ab0bdf537976d2e87dbc65b9367d2fa574739cc3d514')
sha256sums_aarch64=('SKIP')

_fix_permissions() (
  target=$1

  if [[ -L "$target" ]]; then
    return 0
  fi

  if [[ -d "$target" || -x "$target" ]]; then
    chmod 755 "$target"
    return 0
  fi

  if [[ -f "$target" ]]; then
    chmod 644 "$target"
    return 0
  fi

  echo "Unrecognizable filesystem entry: $target" >&2
  return 1
)

prepare() {
# Extract the AppImage
  chmod +x "./$_appimage"
  "./$_appimage" --appimage-extract
# Edit the shortcut
  cd squashfs-root
  sed -i -E "s|Exec=AppRun|Exec=notesnook|g" notesnook.desktop
  sed -i "/X-AppImage-Version=$pkgver/d; /actions=undefined/d" notesnook.desktop
  sed -i 's/--no-sandbox //g' notesnook.desktop
# Delete a folder based the architecture
  if [ "$CARCH" == "x86_64" ]; then
    rm -dr resources/app/build/prebuilds/linux-arm64
  elif [ "$CARCH" == "aarch64" ]; then
    rm -dr resources/app/build/prebuilds/linux-x64
fi
}

package() {
# Create directories
  mkdir -p "$pkgdir/opt/notesnook" "$pkgdir/usr/bin"
# Install
  cd squashfs-root
  for i in 16 32 48 64 128 256 512 1024; do
    mkdir -p "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps"
    ln -s /opt/notesnook/resources/assets/icons/${i}x${i}.png -t "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps"
  done
  install -Dm644 notesnook.desktop -t "$pkgdir/usr/share/applications"
  rm -dr usr AppRun notesnook.desktop notesnook.png .DirIcon resources/app-update.yml
  ln -s /opt/notesnook/notesnook -t "$pkgdir/usr/bin"
  mv * "$pkgdir/opt/notesnook"
# Fix permissions
  find "$pkgdir/opt/notesnook" | while read -r target; do
    _fix_permissions "$target"
  done
}
