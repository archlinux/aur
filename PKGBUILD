# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=notepadnext-bin
pkgver=0.10
pkgrel=1
pkgdesc="A cross-platform, reimplementation of Notepad++ (binary release)"
url="https://github.com/dail8859/NotepadNext"
license=('GPL-3.0-only')
arch=('x86_64')
makedepends=('fuse2')
conflicts=("notepadnext")
provides=("notepadnext")
options=(!strip)
source=("$url/releases/download/v$pkgver/NotepadNext-v$pkgver-x86_64.AppImage")
sha256sums=('0d5d8cdc666786ace0bab26a25f150aeac75127b7971710135b18cef655a9c90')

prepare() {
# Extract the AppImage
  chmod +x "./NotepadNext-v$pkgver-x86_64.AppImage"
  "./NotepadNext-v$pkgver-x86_64.AppImage" --appimage-extract
# Edit the shortcut
  cd squashfs-root/usr/share/applications
  sed -i -E "s|Icon=NotepadNext|Icon=notepadnext|g" NotepadNext.desktop
  sed -i -E "s|Exec=NotepadNext %f|Exec=notepadnext %f|g" NotepadNext.desktop
  sed -i -E "s|MimeType=text/plain;|MimeType=text/plain;application/x-yaml;application/xml;|g" NotepadNext.desktop
}

package() {
# Create directories
  mkdir -p "$pkgdir/opt/NotepadNext" "$pkgdir/usr/bin"
# Install
  cd squashfs-root
  install -Dm644 usr/share/icons/hicolor/scalable/apps/NotepadNext.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/notepadnext.svg"
  install -Dm644 usr/share/applications/NotepadNext.desktop "$pkgdir/usr/share/applications/notepadnext.desktop"
  mv usr/bin usr/lib usr/plugins "$pkgdir/opt/NotepadNext"
  ln -s /opt/NotepadNext/bin/NotepadNext "$pkgdir/usr/bin/notepadnext"
}
