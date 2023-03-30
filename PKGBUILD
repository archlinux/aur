# Maintainer: begin-theadventure <begin-thecontact.ncncb@dralias.com>

_pkgname=flightcore
pkgname=$_pkgname-bin
pkgver=1.12.0
pkgrel=1
pkgdesc="A Northstar installer, updater, and mod-manager (AppImage release)"
arch=('x86_64')
url="https://github.com/R2NorthstarTools/FlightCore"
license=('MIT')
depends=('fuse2' 'zlib')
makedepends=('util-linux')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!strip')
_desktop=flightcore.desktop
_url2=https://raw.githubusercontent.com/R2NorthstarTools/FlightCore/8070b7cad817058b922316a7baea42c38b77055f
source=("$url/releases/download/v$pkgver/flight-core_${pkgver}_amd64.AppImage"
        "$_url2/LICENSE"
        "$_url2/README.md"
        "$_url2/docs/DEVELOPMENT.md"
        "$_url2/docs/FAQ.md")
sha256sums=('6f35efafd80eb804f5c0f7c34aca8c7befc3548959b0cb7f7f84a5bc02dbf682'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  # Create a shortcut
  echo "Categories=Game;" >> $_desktop
  sed -i '1 i\Comment=Installer/Updater/Launcher for Northstar' $_desktop
  sed -i '1 i\StartupWMClass=FlightCore' $_desktop
  sed -i '1 i\Icon=flightcore' $_desktop
  sed -i '1 i\Type=Application' $_desktop
  sed -i '1 i\Terminal=false' $_desktop
  sed -i '1 i\Exec=flightcore %U' $_desktop
  sed -i '1 i\Name=FlightCore' $_desktop
  sed -i '1 i\[Desktop Entry]' $_desktop

  # Extract AppImage
  [[ -d squashfs-root ]] && rm -rf squashfs-root
  chmod 755 flight-core_${pkgver}_amd64.AppImage
  ./flight-core_${pkgver}_amd64.AppImage --appimage-extract
}

package() {
  install -Dm644 squashfs-root/usr/share/icons/hicolor/256x256@2/apps/flight-core.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm644 $_desktop "$pkgdir/usr/share/applications/$_desktop"
  install -Dm644 DEVELOPMENT.md FAQ.md README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm755 flight-core_${pkgver}_amd64.AppImage "$pkgdir/usr/bin/$_pkgname"
}
