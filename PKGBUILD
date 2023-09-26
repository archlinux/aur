# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=youtube-dl-gui
pkgname=$_pkgname-bin
pkgver=2.5.3
pkgrel=1
pkgdesc="A cross-platform GUI for youtube-dl made in Electron and node.js (binary release)"
url="https://github.com/StefanLobbenmeier/youtube-dl-gui"
license=('AGPL3')
arch=('x86_64')
depends=('libappindicator-gtk3' 'libnotify' 'libxss' 'libxtst')
provides=($_pkgname)
conflicts=($_pkgname)
_appimage=Open-Video-Downloader-$pkgver.AppImage
source=("$url/releases/download/v$pkgver/$_appimage")
sha256sums=('b7e45d10fb6005896e608bd0c230df6ab91b7f9488e091972887e837063bb0d2')

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
  mv squashfs-root/open-video-downloader.desktop "$srcdir/$_pkgname.desktop"
  sed -i -E "s|Name=Open-Video-Downloader|Name=Open Video Downloader|g" $_pkgname.desktop
  sed -i -E "s|Exec=AppRun --no-sandbox %U|Exec=$_pkgname %U|g" $_pkgname.desktop
  sed -i '/X-AppImage-Version/d' $_pkgname.desktop
  echo "Keywords=$_pkgname;youtubedlgui;yt-dl-gui;ytdlgui;" >> $_pkgname.desktop
  # Remove the updater
  rm squashfs-root/resources/app-update.yml
}

package() {
  # Create folders
  mkdir -p "$pkgdir/opt/$_pkgname" "$pkgdir/usr/bin"
  # Install
  install -Dm644 $_pkgname.desktop -t "$pkgdir/usr/share/applications"
  cd squashfs-root
  install -Dm644 usr/share/icons/hicolor/0x0/apps/open-video-downloader.png "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/$pkgname.png"
  rm -dr usr AppRun open-video-downloader open-video-downloader.png .DirIcon
  ln -s /opt/$_pkgname/open-video-downloader.bin "$pkgdir/usr/bin/$_pkgname"
  mv * "$pkgdir/opt/$_pkgname"
  # Fix permissions
  find "$pkgdir/opt/$_pkgname" | while read -r target; do
    _fix_permissions "$target"
  done
}
