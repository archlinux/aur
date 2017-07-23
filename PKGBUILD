# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>
# Based on saleae-logic package by Kyle Keen <keenerd@gmail.com>

pkgname=saleae-logic-beta
pkgver=1.2.14
pkgrel=3
pkgdesc="High speed USB logic analyzer."
arch=('x86_64')
url="http://www.saleae.com/"
license=('unknown')  # closed source, none given
depends=('qt5-base')
conflicts=(saleae-logic)
provides=(saleae-logic)

source=("http://downloads.saleae.com/logic/$pkgver/Logic+$pkgver+(64-bit).zip"
        "http://downloads.saleae.com/Saleae+Users+Guide.pdf"
        "133473-SaleaeLogic.svg"
        "saleae-logic.desktop")
sha256sums=('35b950d0bf837f83ae93d6d85aea6378c01bf15ab71bc2749931ee2a1e5555ff'
            'b862b10c75d57010b15663e0f26976ec7a1fc0d7a5a2d4e299b17c5a06185d18'
            '6f5f590c6b29a674b4d2263783430630f271ea296a0ef0ac7787ce081a2b1d9b'
            'cc2a4127af87c8248b08a9cb8d82d542f63cfe77d95478bd469c64fd6722ed7a')

package() {
  # for now, it needs /opt
  cd "$srcdir/Logic $pkgver (64-bit)"
  install -d "$pkgdir/opt/saleae-logic"
  install -d "$pkgdir/usr/share/doc/saleae-logic"
  cp -r ./ "$pkgdir/opt/saleae-logic/"
  find "$pkgdir/opt/saleae-logic" -type d -exec chmod 777 {} \;

  #icon
  install -Dm644 "$srcdir/133473-SaleaeLogic.svg" \
    "$pkgdir/usr/share/pixmaps/SaleaeLogic.svg"
  install -D -m644 "$srcdir/saleae-logic.desktop" \
    "$pkgdir/usr/share/applications/saleae-logic.desktop"

  # docs
  install -Dm644 "$srcdir/Saleae+Users+Guide.pdf" \
    "$pkgdir/usr/share/doc/saleae-logic/"

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
