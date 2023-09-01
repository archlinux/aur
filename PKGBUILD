# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=upscayl
pkgname=$_pkgname-rpm-bin
pkgver=2.7.5
pkgrel=1
pkgdesc="Free and Open Source AI Image Upscaler (binary release)"
url="https://github.com/upscayl/upscayl"
license=('AGPL3')
arch=('x86_64')
depends=('electron')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux.rpm")
sha256sums=('e03e949e9bc21a091133a8617c2b71fd1739ea18ddb020a2351543f8dcff1e4c')

prepare() {
  # Create an exec file
  echo 'exec electron /usr/lib/upscayl/app.asar $@' > $_pkgname
  sed -i '1 i\cd /usr/lib/upscayl' $_pkgname
  sed -i '1 i\export ELECTRON_IS_DEV=0' $_pkgname
  # Edit the shortcut
  mv usr/share/applications/$_pkgname.desktop "$srcdir"
  sed -i -E "s|Exec=/opt/Upscayl/upscayl %U|Exec=$_pkgname %U|g" $_pkgname.desktop
  # Remove unnecessary files
  cd opt/Upscayl/resources
  rm app-update.yml package-type
}

package() {
  # Create a folder
  mkdir -p "$pkgdir/usr/lib/$_pkgname"
  # Install
  mv opt/Upscayl/resources/* "$pkgdir/usr/lib/$_pkgname"
  install -Dm644 opt/Upscayl/icon_128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_pkgname.png"
  install -Dm644 usr/share/icons/hicolor/0x0/apps/$_pkgname.png -t "$pkgdir/usr/share/icons/hicolor/512x512/apps"
  install -Dm644 $_pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm755 $_pkgname -t "$pkgdir/usr/bin"
}
