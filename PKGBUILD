# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=xdelta3-cross-gui
pkgname=$_pkgname-bin
pkgver=1.7.1
pkgrel=1
pkgdesc="A cross-platform GUI for creating xDelta3 patches (binary release)"
url="https://github.com/dan0v/xdelta3-cross-gui"
license=('Apache-2.0')
arch=('x86_64')
depends=('fontconfig' 'hicolor-icon-theme')
optdepends=('xdelta3: to use the system version instead of the bundled one')
makedepends=('fuse2')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/${_pkgname}_linux_AppImage_x86_64.tar.gz")
sha256sums=('cdf3d79d60cd4b29c943441935a9479a55125fd7b5c857c78bf85fe1fcb7dace')

prepare() {
# Extract the AppImage
  chmod +x xDelta3_Cross_Gui-x86_64.AppImage
  ./xDelta3_Cross_Gui-x86_64.AppImage --appimage-extract

# Edit the shortcut
  cd squashfs-root
  mv xdelta3_cross_gui.desktop $_pkgname.desktop
  sed -i -E "s|Icon=icn|Icon=$_pkgname|g" $_pkgname.desktop
  sed -i -E "s|Exec=xdelta3_cross_gui|Exec=$_pkgname|g" $_pkgname.desktop

# Edit the metainfo
  cd usr/share/metainfo
  mv xdelta3_cross_gui.appdata.xml $_pkgname.appdata.xml
  sed -i "s/xdelta3_cross_gui/$_pkgname/g" $_pkgname.appdata.xml
}

package() {
# Create directories
  mkdir -p "$pkgdir/usr/bin" "$pkgdir/opt/$_pkgname"
# Clean up
  cd squashfs-root/usr/bin/Assets/exec
  rm xdelta3_mac xdelta3_x86_64_win.exe
  cd ..
  install -Dm644 doc/1.Readme.txt -t "$pkgdir/usr/share/doc/$_pkgname"
  rm -dr doc
# Install
  cd "$srcdir"/squashfs-root
  install -Dm644 icn.png "$pkgdir/usr/share/icons/hicolor/96x96/apps/$_pkgname.png"
  install -Dm644 $_pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 usr/share/metainfo/$_pkgname.appdata.xml -t "$pkgdir/usr/share/metainfo"
  ln -s /opt/$_pkgname/xdelta3_cross_gui "$pkgdir/usr/bin/$_pkgname"
  mv usr/bin/* "$pkgdir/opt/$_pkgname"
}
