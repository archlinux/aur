# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=slippi-launcher
pkgname=$_pkgname-bin
pkgdesc="The way to play Slippi Online and watch replays (binary release)"
pkgver=2.10.1
pkgrel=2
arch=('x86_64')
url="https://github.com/project-slippi/slippi-launcher"
license=('GPL3')
depends=('libappindicator-gtk3' 'libnotify' 'libxss' 'libxtst')
makedepends=('fuse2')
conflicts=($_pkgname)
provides=($_pkgname)
_appimage=Slippi-Launcher-$pkgver-x86_64.AppImage
_desktop=$_pkgname.desktop
source=("$url/releases/download/v$pkgver/$_appimage")
sha256sums=('be2d1f39bf6afa9ad31ccb457f49820c91164f8cac6da9e2a3a50e8a729aacb9')

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
  mv squashfs-root/slippi-launcher.desktop $_desktop
  sed -i -E "s|Exec=AppRun|Exec=$_pkgname|g" $_desktop
}

package() {
  # Create folders
  mkdir -p "$pkgdir/opt" "$pkgdir/usr/bin"
  # Install
  cd squashfs-root
  for i in 16 24 32 48 64 96 128 256 512; do
    install -Dm644 usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png -t "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps"
  done
  rm -dr usr & rm AppRun $_pkgname.png .DirIcon
  ln -s /opt/$_pkgname/$_pkgname "$pkgdir/usr/bin/$_pkgname"
  cp -r ../squashfs-root "$pkgdir/opt/$_pkgname"
  install -Dm644 ../$_pkgname.desktop -t "$pkgdir/usr/share/applications"
  # Fix permissions
  find "$pkgdir" | while read -r target; do
    _fix_permissions "$target"
  done
}
