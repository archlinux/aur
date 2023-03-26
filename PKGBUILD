# Maintainer: begin-theadventure <begin-thecontact.ncncb@dralias.com>

_pkgname=flightcore
pkgname=$_pkgname-bin
pkgver=1.11.0
pkgrel=2
pkgdesc="A Northstar installer, updater, and mod-manager (AppImage release)"
arch=('x86_64')
url="https://github.com/R2NorthstarTools/FlightCore"
license=('MIT')
depends=('fuse2' 'zlib')
makedepends=('util-linux')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!strip')
_url2=https://raw.githubusercontent.com/R2NorthstarTools/FlightCore/28da58763c7d69c9837da79748e175b04b2bf557
source=("$url/releases/download/v$pkgver/flight-core_${pkgver}_amd64.AppImage"
        "$_url2/LICENSE"
        "$_url2/docs/FAQ.md"
        "$_url2/README.md")
sha256sums=('5b696ec1d113b49849c0c5fe99247865d476c866f9adffc9d81687fd88be4c2d'
            'b0c734c05a4fd65d214cd1791dfe1c039c8b5181354f83ad7f32df1a7872a959'
            '81cb78d9804d74bcf3f11ebf22cfd04c8d3fb747c6b986c9fd610161efb1c855'
            'f51bee45f886b888ea7b9d3b22f5ddb37ebe7f6377a655711ddcce50ee83b686')

prepare() {
  [[ -d squashfs-root ]] && rm -rf squashfs-root
  chmod 755 flight-core_${pkgver}_amd64.AppImage
  ./flight-core_${pkgver}_amd64.AppImage --appimage-extract
  sed -i 's|^Exec=.*|Exec=flightcore|' squashfs-root/flight-core.desktop
  sed -i 's|^Icon=.*|Icon=flightcore|' squashfs-root/flight-core.desktop
}

package() {
  install -Dm644 squashfs-root/usr/share/icons/hicolor/256x256@2/apps/flight-core.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm644 squashfs-root/flight-core.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 FAQ.md README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm755 flight-core_${pkgver}_amd64.AppImage "$pkgdir/usr/bin/$_pkgname"
}
