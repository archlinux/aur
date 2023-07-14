# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=harmonyvpktool
pkgname=$_pkgname-bin
pkgdesc="An electron-based app for unpacking Respawn VPK files (binary release)"
pkgver=1.2.1
pkgrel=1
arch=('x86_64')
url="https://github.com/harmonytf/HarmonyVPKTool"
license=('GPL3')
depends=('libappindicator-gtk3' 'libnotify' 'libxss' 'libxtst')
makedepends=('fuse2')
conflicts=($_pkgname)
provides=($_pkgname)
_appimage=Harmony.VPK.Tool-$pkgver.AppImage
_desktop=$_pkgname.desktop
_url2=https://raw.githubusercontent.com/harmonytf/HarmonyVPKTool/$pkgver
source=("$url/releases/download/$pkgver/$_appimage"
        "$_url2/README.md"
        "$_url2/LICENSE")
sha256sums=('0ed03ed52d49ffeb5c1235f7cdfa942568286e6c0267aa5642b9bcd0a659cef9'
            'SKIP'
            'SKIP')

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
  mv squashfs-root/harmony_vpk_tool.desktop $_desktop
  sed -i '3s/.*/Exec=harmonyvpktool %U/' $_desktop
  sed -i '6s/.*/Icon=harmonyvpktool/' $_desktop
}

package() {
  # Create folders
  mkdir -p "$pkgdir/opt" "$pkgdir/usr/bin"
  # Install
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 $_desktop -t "$pkgdir/usr/share/applications"
  cd squashfs-root
  install -Dm644 usr/share/icons/hicolor/0x0/apps/harmony_vpk_tool.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
  ln -s /opt/HarmonyVPKTool/harmony_vpk_tool "$pkgdir/usr/bin/$_pkgname"
  rm -dr usr & rm AppRun harmony_vpk_tool.png .DirIcon
  cp -r ../squashfs-root "$pkgdir/opt/HarmonyVPKTool"
  # Fix permissions
  find "$pkgdir" | while read -r target; do
    _fix_permissions "$target"
  done
}
