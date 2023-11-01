# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=notepadnext
pkgname=$_pkgname-bin
pkgver=0.6.4
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
sha256sums=('b26e2d5208bce3b70847f1b7c5f863cd7567bd476dd3df68ad433c700564a089')

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
