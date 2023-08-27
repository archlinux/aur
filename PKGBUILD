# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=emojimart
pkgname=$_pkgname-bin
pkgver=0.2.4
pkgrel=2
pkgdesc="Modern emoji picker popup for desktop (binary release)"
arch=('x86_64')
url="https://github.com/vemonet/EmojiMart"
license=('MIT')
depends=('gtk3' 'webkit2gtk')
optdepends=('xdotool: automatically paste to your currently focused app (X11)'
            'ydotool: automatically paste to your currently focused app (Wayland)')
conflicts=($_pkgname)
provides=($_pkgname)
source=("$url/releases/download/v$pkgver/emoji-mart_${pkgver}_amd64.deb"
        "$url/raw/v$pkgver/LICENSE.txt")
sha256sums=('f0046872712068dee3ce5beeb21315ac93fdda91218222882bf7a4b618aac4ed'
            'SKIP')

prepare() {
  # Extract the files
  tar -xf data.tar.gz
  # Edit the shortcut
  cd usr/share/applications
  sed -i -E "s|Comment=Emoji picker for desktop. Built with the Emoji Mart web component, and packaged as a tauri app.|Comment=Emoji picker for desktop|g" emoji-mart.desktop
  sed -i -E "s|Exec=emoji-mart|Exec=$_pkgname|g" emoji-mart.desktop
  sed -i -E "s|Icon=emoji-mart|Icon=$_pkgname|g" emoji-mart.desktop
}

package() {
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/doc/$_pkgname"
  cd usr
  for i in 32x32 128x128 256x256@2; do
    install -Dm644 share/icons/hicolor/$i/apps/emoji-mart.png "$pkgdir/usr/share/icons/hicolor/$i/apps/$_pkgname.png"
  done
  install -Dm644 share/applications/emoji-mart.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm755 bin/emoji-mart "$pkgdir/usr/bin/$_pkgname"
}
