# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=xdelta3-cross-gui
pkgname=$_pkgname-bin
pkgver=1.4.1
pkgrel=2
pkgdesc="A cross-platform GUI for creating xDelta3 patches (binary release)"
arch=('x86_64')
url="https://github.com/dan0v/xdelta3-cross-gui"
license=('Apache2')
makedepends=('fuse2')
conflicts=($_pkgname)
provides=($_pkgname)
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/xdelta3-cross-gui_linux_AppImage_x86_64.tar.gz")
sha256sums=('274c2161a99b4ce4440a33ab200aafbb2744e2735a2db3cb83560281a7a28c2b')

prepare() {
  # Extract the AppImage
  chmod +x "./xDelta3_Cross_Gui-x86_64.AppImage"
  "./xDelta3_Cross_Gui-x86_64.AppImage" --appimage-extract

  # Edit the shortcut
  cd squashfs-root
  sed -i -E "s|Icon=icn|Icon=$_pkgname|g" xdelta3_cross_gui.desktop

  # Edit the metainfo
  cd usr/share/metainfo
  sed -i "s/xdelta3_cross_gui/$_pkgname/g" xdelta3_cross_gui.appdata.xml
}

package() {
  # Create folders
  mkdir -p "$pkgdir/usr/bin" "$pkgdir/opt/$_pkgname"
  # Install
  cd squashfs-root
  install -Dm644 icn.png "$pkgdir/usr/share/icons/hicolor/96x96/apps/$_pkgname.png"
  install -Dm644 xdelta3_cross_gui.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 usr/share/metainfo/xdelta3_cross_gui.appdata.xml "$pkgdir/usr/share/metainfo/$_pkgname.appdata.xml"
  ln -s /opt/$_pkgname/xdelta3_cross_gui "$pkgdir/usr/bin/$_pkgname"
  mv usr/bin/* "$pkgdir/opt/$_pkgname"
}
