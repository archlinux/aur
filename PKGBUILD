# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=slippi-launcher
pkgname=$_pkgname-bin
pkgdesc="The way to play Slippi Online and watch replays (binary release)"
pkgver=2.10.5
pkgrel=1
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
sha256sums=('cd8c5255bc4444bb73e7ff484bc3d47ede99430ea442d494a74fca9a603f6e63')

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
  # Edit a shortcut
  mv squashfs-root/slippi-launcher.desktop $_desktop
  sed -i -E "s|Exec=AppRun|Exec=$_pkgname|g" $_desktop
}

package() {
  # Create folders
  mkdir -p "$pkgdir/opt/$_pkgname" "$pkgdir/usr/bin"
  # Install
  cd squashfs-root
  for i in 16 24 32 48 64 96 128 256 512; do
    install -Dm644 usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png -t "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps"
  done
  rm -dr usr & rm AppRun $_pkgname.png .DirIcon
  mv * "$pkgdir/opt/$_pkgname"
  ln -s /opt/$_pkgname/$_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 ../$_pkgname.desktop -t "$pkgdir/usr/share/applications"
  # Fix permissions
  find "$pkgdir" | while read -r target; do
    _fix_permissions "$target"
  done
}
