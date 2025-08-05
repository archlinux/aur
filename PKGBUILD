# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=crossover-overlay
_pkgname2=crossoverlay
pkgname=$_pkgname-bin
pkgver=3.4.0
pkgrel=1
pkgdesc="🎯 A Crosshair Overlay for any screen (binary release, system Electron)"
url="https://github.com/lacymorrow/crossover"
license=('CC-BY-SA-4.0')
arch=('x86_64' 'i686')
depends=('at-spi2-core' 'electron' 'gtk3' 'libnotify' 'libsecret' 'libxss' 'libxtst'
         'nss' 'util-linux-libs' 'xdg-utils')
optdepends=('libappindicator-gtk3')
provides=("$_pkgname")
conflicts=("$_pkgname")
_desktop=$_pkgname2.desktop
source_x86_64=("$url/releases/download/v$pkgver/CrossOver-$pkgver-amd64.deb")
sha256sums_x86_64=('c17c6276861195ed5fbec1b3dd10405abfe1dd3163a6ff63ef52c52954ded7a3')
#source_i686=("$url/releases/download/v$pkgver/CrossOver-$pkgver-i386.deb")
#sha256sums_i686=('SKIP')

prepare() {
  tar -xf data.tar.xz
# Create an exec file
  echo -e "#!/bin/sh\n\
export ELECTRON_IS_DEV=0\n\
cd /usr/lib/$_pkgname2\n\
exec electron /usr/lib/$_pkgname2/app.asar \$@" > $_pkgname2
# Edit the shortcut
  mv usr/share/applications/crossover.desktop $_desktop
  chmod 644 $_desktop
  sed -i -E "s|Exec=/opt/CrossOver/crossover %U|Exec=$_pkgname2|g" $_desktop
  sed -i -E "s|Icon=crossover|Icon=$_pkgname2|g" $_desktop
# Remove unnecessary files
  cd opt/CrossOver/resources
  rm app-update.yml package-type
}

package() {
# Create a folder
  mkdir -p "$pkgdir/usr/lib/$_pkgname2"
# Install
  install -Dm644 $_desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 usr/share/icons/hicolor/0x0/apps/crossover.png "$pkgdir/usr/share/pixmaps/$_pkgname2.png"
  install -Dm644 usr/share/doc/crossover/changelog.gz "$pkgdir/usr/share/doc/crossover/$_pkgname2"
  install -Dm755 $_pkgname2 -t "$pkgdir/usr/bin"
  ln -s $_pkgname2 "$pkgdir/usr/bin/$_pkgname"
  mv opt/CrossOver/resources/* "$pkgdir/usr/lib/$_pkgname2"
}
