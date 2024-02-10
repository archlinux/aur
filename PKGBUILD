# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=upscayl-rpm-bin
pkgver=2.9.9
pkgrel=1
pkgdesc="Free and Open Source AI Image Upscaler (binary release, system Electron)"
url="https://github.com/upscayl/upscayl"
license=('AGPL3')
arch=('x86_64')
depends=('at-spi2-core' 'electron' 'gtk3' 'libnotify' 'libsecret' 'libxss'
         'libxtst' 'nss' 'util-linux-libs' 'xdg-utils')
optdepends=('libappindicator-gtk3')
provides=("upscayl" "upscayl-bin")
conflicts=("upscayl")
source=("$url/releases/download/v$pkgver/upscayl-$pkgver-linux.rpm")
sha256sums=('b7418c45386ee384a3634ed5184332629b0a8ea072120841306118087c34311e')

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
