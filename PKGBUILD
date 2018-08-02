# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>
# Based on saleae-logic package by Kyle Keen <keenerd@gmail.com>

pkgname=saleae-logic-beta
pkgver=1.2.29
pkgrel=1
pkgdesc="High speed USB logic analyzer."
arch=('x86_64')
url="http://www.saleae.com/"
license=('unknown')  # closed source, none given
depends=('qt5-base' 'openssl-1.0')
conflicts=(saleae-logic)
provides=(saleae-logic)

source=("http://downloads.saleae.com/logic/$pkgver/Logic+$pkgver+(64-bit).zip"
        "133473-SaleaeLogic.svg"
        "saleae-logic.desktop")
sha256sums=('c5cb1bec9f038a9307e1640d81dfaf7e7d53789e69d238e5dbb4b84ad3dc681a'
            '6f5f590c6b29a674b4d2263783430630f271ea296a0ef0ac7787ce081a2b1d9b'
            'cc2a4127af87c8248b08a9cb8d82d542f63cfe77d95478bd469c64fd6722ed7a')

package() {
  # for now, it needs /opt
  cd "$srcdir/Logic $pkgver (64-bit)"
  install -d "$pkgdir/opt/saleae-logic"
  cp -r ./ "$pkgdir/opt/saleae-logic/"
  find "$pkgdir/opt/saleae-logic" -type d -exec chmod 777 {} \;

  #icon
  install -Dm644 "$srcdir/133473-SaleaeLogic.svg" \
    "$pkgdir/usr/share/pixmaps/SaleaeLogic.svg"
  install -D -m644 "$srcdir/saleae-logic.desktop" \
    "$pkgdir/usr/share/applications/saleae-logic.desktop"

  # udev
  install -Dm644 Drivers/99-SaleaeLogic.rules \
    "$pkgdir/usr/lib/udev/rules.d/99-SaleaeLogic.rules"

  # launch script
  install -d "$pkgdir/usr/bin"
  touch "$pkgdir/usr/bin/logic"
  echo -e "#!/bin/sh\nexec /opt/saleae-logic/Logic > /dev/null 2>&1" > "$pkgdir/usr/bin/logic"
  chmod +x "$pkgdir/usr/bin/logic"
}

# vim:set ts=2 sw=2 et:
