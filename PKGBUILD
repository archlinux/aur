# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=notepadnext
pkgname=$_pkgname-bin
pkgver=0.6.3
pkgrel=1
pkgdesc="A cross-platform, reimplementation of Notepad++ (binary release)"
arch=('x86_64')
url="https://github.com/dail8859/NotepadNext"
license=('GPL3')
makedepends=('fuse2')
conflicts=($_pkgname)
provides=($_pkgname)
options=(!strip)
source=("$url/releases/download/v$pkgver/NotepadNext-v$pkgver-x86_64.AppImage")
sha256sums=('80971d30de9a1d0c590d3f76f60cacbd44530c03c4fa132aafe933273bc45af4')

prepare() {
  # Extract the AppImage
  chmod +x "./NotepadNext-v$pkgver-x86_64.AppImage"
  "./NotepadNext-v$pkgver-x86_64.AppImage" --appimage-extract
  cd squashfs-root/usr/share/applications
  # Edit the shortcut
  sed -i -E "s|Icon=NotepadNext|Icon=$_pkgname|g" NotepadNext.desktop
  sed -i -E "s|Exec=NotepadNext %f|Exec=$_pkgname %f|g" NotepadNext.desktop
  sed -i -E "s|MimeType=text/plain;|MimeType=text/plain;application/x-yaml;application/xml;|g" NotepadNext.desktop
}

package() {
  # Create folders
  mkdir -p "$pkgdir/opt/NotepadNext" "$pkgdir/usr/bin"
  # Install
  cd squashfs-root
  install -Dm644 usr/share/icons/hicolor/scalable/apps/NotepadNext.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.png"
  install -Dm644 usr/share/applications/NotepadNext.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  mv usr/bin usr/lib usr/plugins "$pkgdir/opt/NotepadNext"
  ln -s /opt/NotepadNext/bin/NotepadNext "$pkgdir/usr/bin/$_pkgname"
}
