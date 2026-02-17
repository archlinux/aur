# Maintainer: fdossena <info@fdossena.com>

pkgname=flogo
pkgver=1.3.0
pkgrel=1
pkgdesc='Create and run programs using flow charts'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://fdossena.com?p=flogo/index.frag"
license=('AGPL-3.0-or-later')
depends=('electron')
makedepends=()
provides=('flogo')
source=(https://downloads.fdossena.com/Projects/Flogo/Flogo-1.3.0-asar.tar.gz
        flogo.desktop
        flogo.sh
        flogo-mime.xml)
sha256sums=(9573b1b75f55f695d3510092a529acb101afc118a390dbc25d7a907e40ca390e SKIP SKIP SKIP)

package() {
  mkdir -p "$pkgdir/usr/lib/$pkgname"
  cp "$srcdir/app.asar" "$pkgdir/usr/lib/$pkgname"
  install -Dm755 "./flogo.sh" "$pkgdir/usr/bin/flogo"
  install -Dm644 "./flogo.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "./flogo-mime.xml" "$pkgdir/usr/share/mime/packages/$pkgname.xml"
  install -Dm644 "$srcdir/icons/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm644 "$srcdir/icons/icon_file.png" "$pkgdir/usr/share/icons/hicolor/256x256/mimetypes/x-${pkgname}_file.png"
  cd ..
}

post_install(){
  update-mime-database /usr/share/mime >/dev/null 2>&1
  update-desktop-database -q /usr/share/applications >/dev/null 2>&1
  gtk-update-icon-cache -f /usr/share/icons/hicolor >/dev/null 2>&1
  xdg-mime default "/usr/share/applications/$pkgname.desktop" application/x-flogo
}
