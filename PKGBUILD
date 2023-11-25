# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Artorias
# Contributor: Gustavo Chain <me@qustavo.cc>
# Contributor: zxp19821005 <zxp19821005 at 163 dot com>

pkgname=notesnook-bin
pkgdesc="A fully open source & end-to-end encrypted note taking alternative to Evernote (binary release)"
pkgver=2.6.12
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/streetwriters/notesnook"
license=('GPL3')
depends=('alsa-lib' 'libappindicator-gtk3' 'libnotify' 'libsodium' 'libxss' 'libxtst' 'mesa' 'nss')
makedepends=('fuse2')
conflicts=("notesnook")
provides=("notesnook")
_appimage="notesnook_linux_$CARCH-$pkgver.AppImage"
source_x86_64=("$_appimage::$url/releases/download/v$pkgver/notesnook_linux_x86_64.AppImage")
source_aarch64=("$_appimage::$url/releases/download/v$pkgver/notesnook_linux_arm64.AppImage")
sha256sums_x86_64=('103e25fc632645eedb4598f2677850a8428613eed74ec5141182ac9511c3af89')
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
}

package() {
# Create folders
  mkdir -p "$pkgdir/opt/notesnook" "$pkgdir/usr/bin"
# Install
  cd squashfs-root
  for i in 16 32 48 64 128 256 512 1024; do
    install -Dm644 usr/share/icons/hicolor/${i}x${i}/apps/notesnook.png -t "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps"
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
