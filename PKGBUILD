# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=sigma-file-manager
pkgname=$_pkgname-bin
pkgdesc="A free, open-source, quickly evolving, modern file manager (explorer / finder) app (binary release)"
pkgver=1.7.0
pkgrel=2
arch=("x86_64")
url="https://github.com/aleksey-hoffman/sigma-file-manager"
license=('GPL3')
depends=('libappindicator-gtk3' 'libnotify' 'libxss' 'libxtst')
makedepends=('fuse2')
conflicts=($_pkgname)
provides=($_pkgname)
_appimage=Sigma-File-Manager-$pkgver-Linux-Debian.AppImage
source=("$url/releases/download/v$pkgver/$_appimage")
sha256sums=('5192b8e47bcfae7a2676141eefa9ed29636e17e7e4c8e095854e160328ccc58e')

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
  sed -i -E "s|Exec=AppRun|Exec=$_pkgname|g" $_pkgname.desktop
}

package() {
  # Create folders
  mkdir -p "$pkgdir/opt/$_pkgname" "$pkgdir/usr/bin"
  # Install
  cd squashfs-root
  install -Dm644 $_pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 usr/share/icons/hicolor/0x0/apps/$_pkgname.png -t "$pkgdir/usr/share/pixmaps"
  rm -dr usr & rm AppRun $_pkgname.png .DirIcon $_pkgname.desktop
  ln -s /opt/$_pkgname/$_pkgname "$pkgdir/usr/bin/$_pkgname"
  mv * "$pkgdir/opt/$_pkgname"
  # Fix permissions
  find "$pkgdir"| while read -r target; do
    _fix_permissions "$target"
  done
}
