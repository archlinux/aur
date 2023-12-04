# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: John Regan <john@jrjrtech.com>

_pkgname=emoji-keyboard
pkgname=$_pkgname-appimage
pkgver=4.0.0
pkgrel=1
pkgdesc="Virtual keyboard-like emoji palette (AppImage release)"
url="https://github.com/OzymandiasTheGreat/emoji-keyboard"
arch=('x86_64')
license=('MIT')
depends=('fuse2')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
_appimage="${_pkgname}_${pkgver}_amd64.AppImage"
source=("$url/releases/download/$pkgver/$_appimage"
        "$url/raw/v$pkgver/LICENSE")
sha256sums=('860563b900c3df7f1bfc3fa3cf0d269a66cd5d098f22c7e14f62e2bc04e99c02'
            'SKIP')

prepare() {
  # Extract the AppImage
  chmod +x "$_appimage"
  ./"$_appimage" --appimage-extract
  # Create an exec file with an environment variable that disables AppImageLauncher integration
  echo env APPIMAGELAUNCHER_DISABLE=true /opt/$_pkgname/$_pkgname > $_pkgname
}

package() {
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  cd squashfs-root/usr/share
  install -Dm644 applications/$_pkgname.desktop -t "$pkgdir/usr/share/applications"
  for i in 32x32 128x128 256x256@2; do
    install -Dm644 icons/hicolor/$i/apps/$_pkgname.png -t "$pkgdir/usr/share/icons/hicolor/$i/apps"
  done
  cd "$srcdir"
  install -Dm755 $_appimage "$pkgdir/opt/$_pkgname/$_pkgname"
  install -Dm755 $_pkgname -t "$pkgdir/usr/bin"
}
