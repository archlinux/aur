# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=flightcore-bin
pkgver=2.23.0
pkgrel=1
pkgdesc="Installer/Updater/Launcher for Northstar (binary release)"
url="https://github.com/R2NorthstarTools/FlightCore"
license=('MIT')
arch=('x86_64')
depends=('webkit2gtk')
makedepends=('fuse2')
provides=("flightcore")
conflicts=("flightcore")
_appimage=flight-core_${pkgver}_amd64.AppImage
source=("$url/releases/download/v$pkgver/$_appimage"
        "$url/archive/refs/heads/main.zip")
sha256sums=('b10649c8e920599670c32a70ac35b3c062fbf6e5390deadd3f1ccec18a1167b5'
            'SKIP')

prepare() {
# Extract the AppImage
  chmod +x "./$_appimage"
  "./$_appimage" --appimage-extract
# Edit the shortcut
  mv squashfs-root/usr/share/applications/flight-core.desktop flightcore.desktop
  sed -i "s/flight-core/flightcore/g" flightcore.desktop
}

package() {
  install -Dm644 flightcore.desktop -t "$pkgdir/usr/share/applications"
  install -Dm755 squashfs-root/usr/bin/flight-core "$pkgdir/usr/bin/flightcore"
  cd FlightCore-main
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/flightcore"
  cd docs
  install -Dm644 ../README.md DEV-TOOLS.md DEVELOPMENT.md FAQ.md TROUBLESHOOTING.md\
  -t "$pkgdir/usr/share/doc/flightcore"
  cd ../src-tauri/icons
  _icdr=usr/share/icons/hicolor
  install -Dm644 32x32.png "$pkgdir/$_icdr/32x32/apps/flightcore.png"
  install -Dm644 128x128.png "$pkgdir/$_icdr/128x128/apps/flightcore.png"
  install -Dm644 128x128@2x.png "$pkgdir/$_icdr/256x256/apps/flightcore.png"
  install -Dm644 icon.png "$pkgdir/$_icdr/512x512/apps/flightcore.png"
}
