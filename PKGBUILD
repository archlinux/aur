# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=slippi-launcher
pkgname=$_pkgname-bin
pkgdesc="The way to play Slippi Online and watch replays (binary release, system Electron)"
pkgver=2.11.10
pkgrel=1
url="https://github.com/project-slippi/slippi-launcher"
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=('electron' 'libnotify' 'libxss' 'libxtst')
optdepends=('libappindicator-gtk3')
makedepends=('fuse2')
provides=("$_pkgname")
conflicts=("$_pkgname")
_appimage=Slippi-Launcher-$pkgver-x86_64.AppImage
_desktop=$_pkgname.desktop
source=("$url/releases/download/v$pkgver/$_appimage")
sha256sums=('3ab59dd2356a7ba0b335b5513659b66a5b76359f2e05878788049a07be28b96e')

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
) # Source: upscayl-appimage

prepare() {
# Create an exec file
  echo -e "#!/bin/sh\n\
export ELECTRON_IS_DEV=0\n\
cd /usr/lib/slippi-launcher\n\
exec electron /usr/lib/slippi-launcher/app.asar \$@" > $_pkgname
# Extract the AppImage
  chmod +x "./$_appimage"
  "./$_appimage" --appimage-extract
# Edit the shortcut
  mv squashfs-root/slippi-launcher.desktop $_desktop
  sed -i -E "s|Exec=AppRun|Exec=$_pkgname|g" $_desktop
}

package() {
# Create a directory
  mkdir -p "$pkgdir/usr/lib/$_pkgname"
# Clean up
  cd squashfs-root/resources
  rm app-update.yml
  cd app.asar.unpacked/node_modules
  rm -dr bufferutil/prebuilds/linux-arm*
  rm -dr utf-8-validate/prebuilds/linux-arm*
# Install
  cd "$srcdir"
  install -Dm644 $_desktop -t "$pkgdir/usr/share/applications"
  install -Dm755 $_pkgname -t "$pkgdir/usr/bin"
  cd squashfs-root
  for i in 16 24 32 48 64 96 128 256 512; do
    install -Dm644 usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png -t "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps"
  done
  cd resources
  mv * "$pkgdir/usr/lib/$_pkgname"
# Fix permissions
  find "$pkgdir" | while read -r target; do
    _fix_permissions "$target"
  done
}
