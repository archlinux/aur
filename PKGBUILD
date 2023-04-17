# Maintainer: begin-theadventure <begin-thecontact.ncncb@dralias.com>

_pkgname=harmonyvpktool
pkgname=$_pkgname-bin
pkgdesc="An electron-based app for unpacking Respawn VPK files (binary release)"
pkgver=1.2.0
pkgrel=1
arch=('x86_64')
url="https://github.com/harmonytf/HarmonyVPKTool"
license=('GPL3')
makedepends=('fuse2')
conflicts=($_pkgname)
provides=($_pkgname)
_desktop=edit.desktop
_url2=https://raw.githubusercontent.com/harmonytf/HarmonyVPKTool/3514c43014fce57ccb2e49a71b85c552edcd05c0
source=("$url/releases/download/$pkgver/Harmony.VPK.Tool-$pkgver.AppImage"
        "$_url2/LICENSE"
        "$_url2/README.md")
sha256sums=('32acf527f2ad37aae40238fef67ebe9feb16a92d8ddc9e87efd68e9ab1b21992'
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
  chmod +x "./Harmony.VPK.Tool-$pkgver.AppImage"
  "./Harmony.VPK.Tool-$pkgver.AppImage" --appimage-extract
  chmod 755 squashfs-root

  # Edit the shortcut
  cd squashfs-root
  mv harmony_vpk_tool.desktop $_desktop
  chmod 644 $_desktop
  sed -i '3s/.*/Exec=harmonyvpktool %U/' $_desktop
  sed -i '6s/.*/Icon=harmonyvpktool/' $_desktop
  chmod 664 $_desktop
  mv $_desktop harmony_vpk_tool.desktop
}

package() {
  # Create folders
  mkdir -p $pkgdir/opt
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/pixmaps
  mkdir -p $pkgdir/usr/share/applications
  # Install
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  cp -r squashfs-root "$pkgdir/opt/HarmonyVPKTool"
  cd squashfs-root
  ln -s /opt/HarmonyVPKTool/harmony_vpk_tool $pkgdir/usr/bin/$_pkgname
  ln -s /opt/HarmonyVPKTool/harmony_vpk_tool.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  ln -s /opt/HarmonyVPKTool/harmony_vpk_tool.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"

  find "$pkgdir" | while read -r target; do
    _fix_permissions "$target"
  done
}
