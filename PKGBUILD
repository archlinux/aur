# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=youtube-dl-gui
pkgname=$_pkgname-bin
pkgver=2.5.6
pkgrel=1
pkgdesc="A cross-platform GUI for youtube-dl made in Electron and node.js (binary release, system Electron)"
url="https://github.com/StefanLobbenmeier/youtube-dl-gui"
license=('AGPL3')
arch=('x86_64')
depends=('electron' 'libappindicator-gtk3' 'libnotify' 'libxss' 'libxtst')
provides=("$_pkgname")
conflicts=("$_pkgname")
_appimage=Open-Video-Downloader-$pkgver.AppImage
source=("$url/releases/download/v$pkgver/$_appimage")
sha256sums=('758b9f6f3ec456ba70e95208933bdcd952e60167ca9b7d751a3c9f6f80c4d735')

prepare() {
# Create an exec file
  echo -e "#!/bin/sh\n\
export ELECTRON_IS_DEV=0\n\
cd /usr/lib/$_pkgname\n\
exec electron /usr/lib/$_pkgname/app.asar \$@" > $_pkgname
# Extract the AppImage
  chmod +x "./$_appimage"
  "./$_appimage" --appimage-extract
# Edit the shortcut
  mv squashfs-root/open-video-downloader.desktop "$_pkgname.desktop"
  sed -i -E "s|Name=Open-Video-Downloader|Name=Open Video Downloader|g" $_pkgname.desktop
  sed -i -E "s|Exec=AppRun --no-sandbox %U|Exec=$_pkgname %U|g" $_pkgname.desktop
  sed -i '/X-AppImage-Version/d' $_pkgname.desktop
  echo "Keywords=$_pkgname;youtubedlgui;yt-dl-gui;ytdlgui;" >> $_pkgname.desktop
}

package() {
# Create a folder
  mkdir -p "$pkgdir/usr/lib/$_pkgname"
# Install
  install -Dm644 $_pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm755 $_pkgname -t "$pkgdir/usr/bin"
  cd squashfs-root
  install -Dm644 usr/share/icons/hicolor/0x0/apps/open-video-downloader.png "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/$pkgname.png"
  install -Dm755 resources/app.asar -t "$pkgdir/usr/lib/$_pkgname"
}
