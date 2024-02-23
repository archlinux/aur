# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=notepadnext-bin
pkgver=0.7
pkgrel=1
pkgdesc="A cross-platform, reimplementation of Notepad++ (binary release)"
url="https://github.com/dail8859/NotepadNext"
license=('GPL3')
arch=('x86_64')
makedepends=('fuse2')
conflicts=("notepadnext")
provides=("notepadnext")
options=(!strip)
source=("https://nightly.link/dail8859/NotepadNext/actions/runs/8009956505/NotepadNext-Linux-Qt6.6-AppImage.zip")
sha256sums=('7b3f0802f4a3dd16afcb66cbd71f1a1f62458003fae324ddc93c2e116d7ce652')

prepare() {
# Extract the AppImage
  chmod +x "./NotepadNext-v$pkgver-x86_64.AppImage"
  "./NotepadNext-v$pkgver-x86_64.AppImage" --appimage-extract
  cd squashfs-root/usr/share/applications
# Edit the shortcut
  sed -i -E "s|Icon=NotepadNext|Icon=notepadnext|g" NotepadNext.desktop
  sed -i -E "s|Exec=NotepadNext %f|Exec=notepadnext %f|g" NotepadNext.desktop
  sed -i -E "s|MimeType=text/plain;|MimeType=text/plain;application/x-yaml;application/xml;|g" NotepadNext.desktop
}

package() {
# Create directories
  mkdir -p "$pkgdir/opt/NotepadNext" "$pkgdir/usr/bin"
# Install
  cd squashfs-root
  install -Dm644 usr/share/icons/hicolor/scalable/apps/NotepadNext.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/notepadnext.png"
  install -Dm644 usr/share/applications/NotepadNext.desktop "$pkgdir/usr/share/applications/notepadnext.desktop"
  mv usr/bin usr/lib usr/plugins "$pkgdir/opt/NotepadNext"
  ln -s /opt/NotepadNext/bin/NotepadNext "$pkgdir/usr/bin/notepadnext"
}
