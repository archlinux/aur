# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=upscayl
pkgname=$_pkgname-rpm-bin
pkgver=2.5.5
pkgrel=4
pkgdesc="Free and Open Source AI Image Upscaler (binary release)"
url="https://github.com/upscayl/upscayl"
license=('AGPL3')
arch=('x86_64')
depends=('electron')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux.rpm")
sha256sums=('c5f5bf396c1d4631b894d9e4d076ff3bbeef61ab4fbfcfd770eea831d81c1975')

prepare() {
  # Create an exec file
  echo 'exec electron /usr/lib/upscayl/app.asar $@' > $_pkgname
  sed -i '1 i\cd /usr/lib/upscayl' $_pkgname
  sed -i '1 i\export ELECTRON_IS_DEV=0' $_pkgname
  # Edit the shortcut
  mv usr/share/applications/$_pkgname.desktop "$srcdir"
  sed -i -E "s|Exec=/opt/Upscayl/upscayl %U|Exec=$_pkgname %U|g" $_pkgname.desktop
}

package() {
  # Create a folder
  mkdir -p "$pkgdir/usr/lib/$_pkgname"
  # Install
  mv opt/Upscayl/resources/* "$pkgdir/usr/lib/$_pkgname"
  install -Dm644 usr/share/icons/hicolor/0x0/apps/$_pkgname.png -t "$pkgdir/usr/share/icons/hicolor/512x512/apps"
  install -Dm644 $_pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm755 $_pkgname -t "$pkgdir/usr/bin"
}
