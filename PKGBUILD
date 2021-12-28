# Maintainer: 0b100100 <0b100100 at protonmail dot ch>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=linrad
pkgver=05.01
pkgrel=1
pkgdesc="Software defined radio receiver for x11"
arch=('x86_64')
url="https://www.sm5bsz.com/linuxdsp/linrad.htm"
license=('MIT')
depends=('portaudio' 'libxext' 'libusb-compat')
optdepends=('hamradio-menus: XDG menus for ham radio software')
makedepends=('nasm' 'icoutils')
source=("$pkgname-$pkgver.tbz::https://www.sm5bsz.com/linuxdsp/archive/lir${pkgver/./-}.tbz"
        "$pkgname.desktop"
        "$pkgname-wrapper.sh"
        "$pkgname-obey-cflags-and-ldflags.patch"
        "$pkgname-gcc_11_1_0.patch")
sha512sums=('7b673c2c76122104dfe5a038f95e6a47a424796114ae4e8d3845987b486539803d63c1b9eeec00360fb5fa160304584644352d5853e6f74eeae81204ecf1afca'
            'f1ce10d624f67bd4f2e243747c7bf180d4a70d27882ed4d574a905537182b9e1d684bb0853a8b96b3ebaaef1570348f25dbf7ed5c18737346af76848b1931a5d'
            'c36890d23ceb992431fcd6944e03fa51f14c746f1542df94e67fe675eae18bb7dee14ad6239578f8a92dcbd1bcad4f1c4b1dc9e45dccb66d990c5777300f8ce2'
            'f147f48c7a8e7d90878d196ff01ec920fb823c753fe5db21efb1c442b2bed69c7c88e89ccf5ac0bc8d4e14ebfa33662d133e81a2b40c8238d7c3b4b1f06c1c67'
            'fca3e6e8b70472d89d8100ce6d8d238898ee599053b97d967cb017532462c78aaeec3cbfbb7bbcb8cf21f8f05533de8515ff31a524275dee113c992c167aeec4')

prepare() {
  cd "$pkgname-$pkgver"
  patch -N -i "$srcdir/$pkgname-obey-cflags-and-ldflags.patch"
  patch -N -i "$srcdir/$pkgname-gcc_11_1_0.patch"

  # Fix path for help and error files
  sed -i "s|help.lir|/usr/share/$pkgname/help.lir|g" menu.c help.c
  sed -i "s|errors.lir|/usr/share/$pkgname/linrad/errors.lir|g" help.c

  ./clean
  autoreconf -fiv
  ./configure
}

build() {
  cd "$pkgname-$pkgver"
  make xlinrad64
}

package(){
  icotool -x $pkgname-$pkgver/cmake/$pkgname.ico -o $pkgname.png
  install -Dm644 $pkgname.png -t "$pkgdir/usr/share/pixmaps/"
  install -Dm644 $pkgname.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm755 $pkgname-wrapper.sh "$pkgdir/usr/bin/$pkgname"

  cd "$pkgname-$pkgver"
  install -Dm755 xlinrad64 -t "$pkgdir/usr/bin/"
  install -Dm644 *.lir -t "$pkgdir/usr/share/$pkgname/"
  install -Dm644 z_*.txt -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
