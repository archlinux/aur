# Maintainer: Laura Demkowicz-Duffy <dev at demkowiczduffy dot co dot uk>
# Contributor: 0b100100 <0b100100 at protonmail dot ch>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=linrad
pkgver=05.02
pkgrel=2
pkgdesc="Software defined radio receiver for x11"
arch=('i686' 'x86_64')
url="https://www.sm5bsz.com/linuxdsp/linrad.htm"
license=('MIT')
depends=('portaudio' 'libxext' 'libusb-compat' 'glibc' 'bash' 'libx11')
optdepends=('hamradio-menus: XDG menus for ham radio software')
makedepends=('nasm' 'icoutils')
source=("$pkgname-$pkgver.tbz::https://www.sm5bsz.com/linuxdsp/archive/lir${pkgver/./-}.tbz"
        "$pkgname.desktop"
        "$pkgname-wrapper.sh"
        "$pkgname-obey-cflags-and-ldflags.patch")
sha512sums=('c3ead1c91c6224ac63978f14d1f03979fcf825b89f33583805981dfc8200ff91f4469a70c7286058583efca4b1641211dcfaaf7087b12bfe50adca69a257571c'
            '7b4d462d422b15c7c9249544d0792cd9f9902ceb10708770b8594f7cfa226b8aca2617168bcfb88861d6db76e7d573ea86812c3ab20d1ae4c8a2e92ee832e3e7'
            '1c661e4bea550ae496af121fc1c658cccc1fbe15c4aecb783641064729d5593f501fb977dff310739c9e303d4869ddafb36df3290c242df139560e6cbd4c661a'
            '03a79d0d28ee0685c452cc8239c85a6d389dfb2ad95d731ed5b3db71f588027a1d0e507a2108d9b2c0ab6d524239bdbfcb37f88cccee2e34163d4a91447cc1ac')
provides=("xlinrad=$pkgver")
conflicts=('xlinrad')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i "$srcdir/$pkgname-obey-cflags-and-ldflags.patch"

  # Fix path for help and error files
  sed -i "s|help.lir|/usr/share/$pkgname/help.lir|g" menu.c help.c
  sed -i "s|errors.lir|/usr/share/$pkgname/errors.lir|g" help.c

  ./clean
  autoreconf -fiv
  ./configure
}

build() {
  cd "$pkgname-$pkgver"
  if [[ "${CARCH}" == "x86_64" ]]; then
    make xlinrad64
  else
    make xlinrad
  fi
}

package(){
  icotool -x $pkgname-$pkgver/cmake/$pkgname.ico -o $pkgname.png
  install -Dm644 $pkgname.png -t "$pkgdir/usr/share/pixmaps/"
  install -Dm644 $pkgname.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm755 $pkgname-wrapper.sh "$pkgdir/usr/bin/$pkgname"

  cd "$pkgname-$pkgver"
  install -Dm755 xlinrad* "$pkgdir/usr/bin/x$pkgname"
  install -Dm644 *.lir -t "$pkgdir/usr/share/$pkgname/"
  install -Dm644 z_*.txt -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
