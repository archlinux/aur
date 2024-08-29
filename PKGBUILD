# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=upscayl-rpm-bin
pkgver=2.11.5
pkgrel=2
pkgdesc="Free and Open Source AI Image Upscaler (binary release, system Electron)"
url="https://github.com/upscayl/upscayl"
license=('AGPL-3.0-only')
arch=('x86_64')
depends=('at-spi2-core' 'electron' 'gtk3' 'libnotify' 'libsecret' 'libxss' 'libxtst'
         'nss' 'util-linux-libs' 'vulkan-icd-loader' 'xdg-utils')
optdepends=('libappindicator-gtk3')
provides=("upscayl" "upscayl-bin")
conflicts=("upscayl")
source=("$url/releases/download/v$pkgver/upscayl-$pkgver-linux.rpm")
sha256sums=('e98aabf3dcbfd8c83e847f05e4ed7a0a077ec61d5d2e9e859825dc671d6cda4a')

prepare() {
# Create an exec file
  echo -e "#!/bin/sh\n\
export ELECTRON_IS_DEV=0\n\
cd /usr/lib/upscayl\n\
exec electron /usr/lib/upscayl/app.asar \$@" > upscayl
# Edit the shortcut
  mv usr/share/applications/upscayl.desktop "$srcdir"
  sed -i -E "s|Exec=/opt/Upscayl/upscayl %U|Exec=upscayl %U|g" upscayl.desktop
}

package() {
# Create a directory
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
