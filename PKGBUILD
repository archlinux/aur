# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>
# Based on saleae-logic package by Kyle Keen <keenerd@gmail.com>

pkgname=saleae-logic-beta
pkgver=1.2.2
pkgrel=4
pkgdesc="High speed USB logic analyzer."
arch=('i686' 'x86_64')
url="http://www.saleae.com/"
license=('unknown')  # closed source, none given
depends=('gcc-libs' 'gtk2' 'libice')
conflicts=(saleae-logic)
provides=(saleae-logic)

case $CARCH in
  'i686')
    source=("http://downloads.saleae.com/betas/$pkgver/Logic+$pkgver+(32-bit).zip"
            "http://downloads.saleae.com/Saleae+Users+Guide.pdf"
            "http://opendesktop.org/CONTENT/content-files/133473-SaleaeLogic.svg"
            "saleae-logic.desktop")
    sha256sums=('dd727a5354f0e551ef563d4e512e3e300ad77c159d788cfc823fae39e2feb5bd'
             'b862b10c75d57010b15663e0f26976ec7a1fc0d7a5a2d4e299b17c5a06185d18'
             '6f5f590c6b29a674b4d2263783430630f271ea296a0ef0ac7787ce081a2b1d9b'
             'cc2a4127af87c8248b08a9cb8d82d542f63cfe77d95478bd469c64fd6722ed7a')
    __arch=' (32-bit)' ;;
  'x86_64')
    source=("http://downloads.saleae.com/betas/$pkgver/Logic+$pkgver+(64-bit).zip"
            "http://downloads.saleae.com/Saleae+Users+Guide.pdf"
            "http://opendesktop.org/CONTENT/content-files/133473-SaleaeLogic.svg"
            "saleae-logic.desktop")
    sha256sums=('228c1bdb2977e096fe04f2af8a17cc821e7dd3aa4c9954e75e0e9048acb81f62'
             'b862b10c75d57010b15663e0f26976ec7a1fc0d7a5a2d4e299b17c5a06185d18'
             '6f5f590c6b29a674b4d2263783430630f271ea296a0ef0ac7787ce081a2b1d9b'
             'cc2a4127af87c8248b08a9cb8d82d542f63cfe77d95478bd469c64fd6722ed7a')
    __arch=' (64-bit)' ;;
esac

package() {
  # for now, it needs /opt
  cd "$srcdir/Logic $pkgver$__arch"
  install -d "$pkgdir/opt/saleae-logic"
  install -d "$pkgdir/usr/share/doc/saleae-logic"
  cp -r ./ "$pkgdir/opt/saleae-logic/"
  find "$pkgdir/opt/saleae-logic" -type d -exec chmod 777 {} \;
  #  chmod 0777 "$pkgdir/opt/saleae-logic"
  #icon
  install -Dm644 "$srcdir/133473-SaleaeLogic.svg" "$pkgdir/usr/share/pixmaps/SaleaeLogic.svg"
  install -D -m644 "$srcdir/saleae-logic.desktop" \
    "$pkgdir/usr/share/applications/saleae-logic.desktop"
  # docs
  install -Dm644 ../../*.pdf "$pkgdir/usr/share/doc/saleae-logic/"
  # udev
  install -Dm644 Drivers/99-SaleaeLogic.rules "$pkgdir/etc/udev/rules.d/99-SaleaeLogic.rules" 
  # launch script
  install -d "$pkgdir/usr/bin"
  touch "$pkgdir/usr/bin/logic"
  echo -e "#!/bin/sh\nexec /opt/saleae-logic/Logic > /dev/null 2>&1" > "$pkgdir/usr/bin/logic"
  chmod +x "$pkgdir/usr/bin/logic"
}

# vim:set ts=2 sw=2 et:
