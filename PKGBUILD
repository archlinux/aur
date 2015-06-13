# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=saleae-logic
pkgver=1.1.15
pkgrel=5
pkgdesc="High speed USB logic analyzer."
arch=('i686' 'x86_64')
url="http://www.saleae.com/"
license=('unknown')  # closed source, none given
depends=('gcc-libs' 'gtk2' 'libice')

case $CARCH in
  'i686')
    source=("http://downloads.saleae.com/Logic%20$pkgver%20(32-bit).zip"
            "http://downloads.saleae.com/Logic%20Guide.pdf"
            "http://opendesktop.org/CONTENT/content-files/133473-SaleaeLogic.svg"
            "saleae-logic.desktop")
    md5sums=('c33210a9b99e5c09bd9a56658fa279c6'
             '836db7ec757b1e6453602ed4831d4765'
             '96aac500508492509d8e47645a826af8'
             '120198dc1ce881e4959da215dc1ab8f5')
    __arch=' (32-bit)' ;;
  'x86_64')
    source=("http://downloads.saleae.com/Logic%20$pkgver%20(64-bit).zip" \
            "http://downloads.saleae.com/Logic%20Guide.pdf"
            "http://opendesktop.org/CONTENT/content-files/133473-SaleaeLogic.svg"
            "saleae-logic.desktop")
    md5sums=('a5074f4bf198ebb95b6e08309b207a88'
             '836db7ec757b1e6453602ed4831d4765'
             '96aac500508492509d8e47645a826af8'
             '120198dc1ce881e4959da215dc1ab8f5')
    __arch=' (64-bit)' ;;
esac

package() {
  # for now, it needs /opt
  cd "$srcdir/Logic $pkgver$__arch"
  install -d "$pkgdir/opt/saleae-logic"
  install -d "$pkgdir/usr/share/doc/saleae-logic"
  cp -r ./ "$pkgdir/opt/saleae-logic/"
  touch "$pkgdir/opt/saleae-logic/Settings/settings.xml"
  chmod 0666 "$pkgdir/opt/saleae-logic/Settings/settings.xml"
  #icon
  install -Dm644 "$srcdir/133473-SaleaeLogic.svg" "$pkgdir/usr/share/pixmaps/SaleaeLogic.svg"
  install -D -m644 "$srcdir/saleae-logic.desktop" \
    "$pkgdir/usr/share/applications/saleae-logic.desktop"
  # docs
  install -Dm644 ../../*.pdf "$pkgdir/usr/share/doc/saleae-logic/"
  # udev
  sed -i 's/SYSFS/ATTRS/g' Drivers/99-SaleaeLogic.rules
  install -Dm644 Drivers/99-SaleaeLogic.rules "$pkgdir/etc/udev/rules.d/99-SaleaeLogic.rules" 
  # launch script
  install -d "$pkgdir/usr/bin"
  touch "$pkgdir/usr/bin/logic"
  echo -e "#!/bin/sh\nexec /opt/saleae-logic/Logic > /dev/null 2>&1" > "$pkgdir/usr/bin/logic"
  chmod +x "$pkgdir/usr/bin/logic"
}



