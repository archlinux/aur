# Maintainer: Peter Ivanov <ivanovp@gmail.com>

pkgname=nexys2prog
pkgver=20101021
pkgrel=1
pkgdesc="A tool to load .bit files to Digilent's Nexys 2 board"
arch=("i686" "x86_64")
url="http://ixo-jtag.sourceforge.net/nexys2-linux-howto.html"
license=("GPL2")
depends=(libftd2xx fxload urjtag-svn)
makedepends=(svn)
options=('!strip')
source=(nexys2prog_path.patch 55-nexys2.rules)
md5sums=(651a177d161a2464b49dda15a3606776 94eda290718149882b7f67d97857329c)

_svnroot=https://ixo-jtag.svn.sourceforge.net/svnroot/ixo-jtag/nexys2prog/trunk
_svnname=nexys2prog

build() {
  msg "Connecting to SVN server..."
  if [[ -d $srcdir/$pkgname-$pkgver ]]; then
    cd $srcdir/$pkgname-$pkgver && svn update || return 1
  else
    svn co $_svnroot $srcdir/$pkgname-$pkgver || return 1
    cd $srcdir/$pkgname-$pkgver
  fi

  msg "SVN checkout done or server timeout"
  cd "$srcdir/$pkgname-$pkgver/"
  if [ ! -f nexys2prog.patched ]; then
      patch -p2 < ../nexys2prog_path.patch
      touch nexys2prog.patched
  fi
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/share/${pkgname}
  install -d ${pkgdir}/etc/udev/rules.d
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 usb_jtag.hex ${pkgdir}/usr/share/${pkgname}/usb_jtag.hex
  install -Dm644 ../55-nexys2.rules ${pkgdir}/etc/udev/rules.d/55-nexys2.rules
}
