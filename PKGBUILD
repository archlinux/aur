# Maintainer: Peter Ivanov <ivanovp@gmail.com>

pkgname=nexys2prog
pkgver=20101021
pkgrel=3
pkgdesc="A tool to load .bit files to Digilent's Nexys 2 board"
arch=("i686" "x86_64")
url="http://ixo-jtag.sourceforge.net/nexys2-linux-howto.html"
license=("GPL2")
depends=(libftd2xx fxload urjtag)
makedepends=(git)
options=('!strip')
_gitroot="git+https://github.com/svn2github/ixo-usb-jtag.git"
_gitname=ixo-usb-jtag
source=("$_gitname::$_gitroot"
        "nexys2prog_path.patch"
        "55-nexys2.rules")
md5sums=('SKIP'
        '651a177d161a2464b49dda15a3606776' 
        '94eda290718149882b7f67d97857329c')

#pkgver() {
#  cd "$srcdir/$_gitname"
#  msg `pwd`
#  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/_//'
#}

build() {
  cd "$srcdir/$_gitname/$pkgname/trunk"
  if [ ! -f nexys2prog.patched ]; then
      patch -p2 < ../../../nexys2prog_path.patch
      touch nexys2prog.patched
  fi
}

package() {
  cd "$srcdir/$_gitname/$pkgname/trunk"
  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/share/${pkgname}
  install -d ${pkgdir}/etc/udev/rules.d
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 usb_jtag.hex ${pkgdir}/usr/share/${pkgname}/usb_jtag.hex
  install -Dm644 ../../../55-nexys2.rules ${pkgdir}/etc/udev/rules.d/55-nexys2.rules
}
