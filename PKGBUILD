# Maintainer: Kyle Keen <keenerd@gmail.com>

# if you want 32 bit, 1.2.10 was the last version supported

pkgname=saleae-logic
pkgver=1.2.18
pkgrel=1
pkgdesc="High speed USB logic analyzer."
arch=('x86_64')
url="http://www.saleae.com/"
license=('unknown')  # closed source, none given
depends=('gcc-libs' 'gtk2' 'libice' 'libdbusmenu-qt5' 'openssl-1.0')

#source_i686=("http://downloads.saleae.com/logic/$pkgver/Logic%20$pkgver%20(32-bit).zip"
#             "http://downloads.saleae.com/Logic%20Guide.pdf"
#             "http://kmkeen.com/tmp/133473-SaleaeLogic.svg"
#             "saleae-logic.desktop")
source_x86_64=("http://downloads.saleae.com/logic/$pkgver/Logic%20$pkgver%20(64-bit).zip"
               "http://downloads.saleae.com/Logic%20Guide.pdf"
               "http://kmkeen.com/tmp/133473-SaleaeLogic.svg"
               "saleae-logic.desktop")
md5sums_x86_64=('8c586a272a89019540cc365c82ade451'
                '836db7ec757b1e6453602ed4831d4765'
                '96aac500508492509d8e47645a826af8'
                '120198dc1ce881e4959da215dc1ab8f5')

case $CARCH in
  'i686')
    __arch=' (32-bit)' ;;
  'x86_64')
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
  # 1.2.9 wants to write junk everywhere
  chmod 0777 "$pkgdir/opt/saleae-logic"
  chmod 0777 "$pkgdir/opt/saleae-logic/Databases"
  #icon
  install -Dm644 "$srcdir/133473-SaleaeLogic.svg" "$pkgdir/usr/share/pixmaps/SaleaeLogic.svg"
  install -D -m644 "$srcdir/saleae-logic.desktop" \
    "$pkgdir/usr/share/applications/saleae-logic.desktop"
  # docs
  install -Dm644 "$srcdir/"*.pdf "$pkgdir/usr/share/doc/saleae-logic/"
  # udev
  sed -i 's/SYSFS/ATTRS/g' Drivers/99-SaleaeLogic.rules
  install -Dm644 Drivers/99-SaleaeLogic.rules "$pkgdir/usr/lib/udev/rules.d/99-SaleaeLogic.rules" 
  # launch script
  install -d "$pkgdir/usr/bin"
  touch "$pkgdir/usr/bin/logic"
  echo -e "#!/bin/sh\nLD_LIBRARY_PATH=/usr/lib/openssl-1.0-compat exec /opt/saleae-logic/Logic &>/dev/null" > "$pkgdir/usr/bin/logic"
  chmod +x "$pkgdir/usr/bin/logic"
  # QT_DEBUG_PLUGINS=1 ./Logic
}



