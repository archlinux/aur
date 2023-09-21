# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=upscayl
pkgname=$_pkgname-rpm-bin
pkgver=2.8.5
pkgrel=1
pkgdesc="Free and Open Source AI Image Upscaler (binary release)"
url="https://github.com/upscayl/upscayl"
license=('AGPL3')
arch=('x86_64')
depends=('electron')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux.rpm")
sha256sums=('3440c6530f2b2b00615975540649156dcbefb5576f322476f2a56628b550956d')

prepare() {
  # Create an exec file
  echo -e "export ELECTRON_IS_DEV=0\n\
cd /usr/lib/$_pkgname\n\
exec electron /usr/lib/$_pkgname/app.asar \$@" > $_pkgname
  # Edit the shortcut
  mv usr/share/applications/$_pkgname.desktop "$srcdir"
  sed -i -E "s|Exec=/opt/Upscayl/$_pkgname %U|Exec=$_pkgname %U|g" $_pkgname.desktop
  # Remove unnecessary files
  cd opt/Upscayl/resources
  rm app-update.yml package-type
}

package() {
  # Create a folder
  mkdir -p "$pkgdir/usr/lib/$_pkgname"
  # Install
  install -Dm644 $_pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm755 $_pkgname -t "$pkgdir/usr/bin"
  cd opt/Upscayl/resources
  install -Dm644 128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_pkgname.png"
  install -Dm644 512x512.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
  rm 128x128.png 512x512.png org.upscayl.Upscayl.desktop
  mv * "$pkgdir/usr/lib/$_pkgname"
}
