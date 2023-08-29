# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Artorias
# Contributor: Gustavo Chain <me@qustavo.cc>
# Contributor: zxp19821005 <zxp19821005 at 163 dot com>

_pkgname=notesnook
pkgname=$_pkgname-bin
pkgdesc="A fully open source & end-to-end encrypted note taking alternative to Evernote (binary release)"
pkgver=2.6.1
pkgrel=3
arch=('x86_64' 'aarch64')
url="https://github.com/streetwriters/notesnook"
license=('GPL3')
depends=('libappindicator-gtk3' 'libnotify' 'libsodium' 'libxss' 'libxtst')
makedepends=('fuse2')
conflicts=($_pkgname)
provides=($_pkgname)
_appimage="${_pkgname}_${pkgver}_linux.AppImage"
source_x86_64=("$_appimage::$url/releases/download/v$pkgver/${_pkgname}_linux_x86_64.AppImage")
source_aarch64=("$_appimage::$url/releases/download/v$pkgver/${_pkgname}_linux_arm64.AppImage")
sha256sums_x86_64=('3cb1cfd50e3ec5c1f2af4df6dcae010fea07e7b4aca6cac073145efc2e911435')
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
  sed -i -E "s|Exec=AppRun|Exec=$_pkgname|g" squashfs-root/$_pkgname.desktop
}

package() {
  # Create folders
  mkdir -p "$pkgdir/opt/$_pkgname" "$pkgdir/usr/bin"
  # Install
  cd squashfs-root
  for i in 16 32 48 64 128 256 512 1024; do
    install -Dm644 usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png -t "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps"
  done
  install -Dm644 $_pkgname.desktop -t "$pkgdir/usr/share/applications"
  rm -dr usr & rm AppRun $_pkgname.desktop $_pkgname.png .DirIcon
  ln -s /opt/$_pkgname/$_pkgname "$pkgdir/usr/bin/$_pkgname"
  mv * "$pkgdir/opt/$_pkgname"
  # Fix permissions
  find "$pkgdir" | while read -r target; do
    _fix_permissions "$target"
  done
}
