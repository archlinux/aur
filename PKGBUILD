# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=upscayl-rpm-bin
pkgver=2.9.4
pkgrel=1
pkgdesc="Free and Open Source AI Image Upscaler (binary release, system Electron)"
url="https://github.com/upscayl/upscayl"
license=('AGPL3')
arch=('x86_64')
depends=('at-spi2-core' 'electron' 'libnotify' 'libxss' 'libxtst' 'xdg-utils')
optdepends=('libappindicator-gtk3')
provides=("upscayl")
conflicts=("upscayl")
source=("$url/releases/download/v$pkgver/upscayl-$pkgver-linux.rpm")
sha256sums=('c7116e1d9d340d7ca821a4fbae9e8f8ec1b3a1eb8f1e13357d33f4e79e6b1b06')

prepare() {
# Create an exec file
  echo -e "export ELECTRON_IS_DEV=0\n\
cd /usr/lib/upscayl\n\
exec electron /usr/lib/upscayl/app.asar \$@" > upscayl
# Edit the shortcut
  mv usr/share/applications/upscayl.desktop "$srcdir"
  sed -i -E "s|Exec=/opt/Upscayl/upscayl %U|Exec=upscayl %U|g" upscayl.desktop
}

package() {
# Create a folder
  mkdir -p "$pkgdir/usr/lib/upscayl"
# Install
  install -Dm644 upscayl.desktop -t "$pkgdir/usr/share/applications"
  install -Dm755 upscayl -t "$pkgdir/usr/bin"
  cd opt/Upscayl/resources
  install -Dm644 128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/upscayl.png"
  install -Dm644 512x512.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/upscayl.png"
  rm 128x128.png 512x512.png app-update.yml org.upscayl.Upscayl.desktop package-type
  mv * "$pkgdir/usr/lib/upscayl"
}
