# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: shimi <shimi.chen@gmail.com>
# Contributor: Dmytro Meleshko <dmytro.meleshko@gmail.com>
pkgname=imagewriter
_pkgver=1.10.1432200249.1d253d9-2.15
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A graphical utility for writing raw disk images & hybrid isos to USB keys"
arch=('x86_64')
url="https://github.com/openSUSE/imagewriter"
license=('GPL2')
depends=('qt5-base' 'udisks2')
source=("https://download.opensuse.org/tumbleweed/repo/src-oss/src/$pkgname-$_pkgver.src.rpm")
sha256sums=('ecd09c86abc53d4179483f1953f24b1ceaf51d239540cdc430c3cd94d70c23b4')

prepare() {
  bsdtar xvf "$pkgname-${_pkgver%-*}.tar.xz"
  find . -name '*.cpp' -exec sed -i -e '/sysctl.h/d' {} \;
  find . -type f -exec sed -i 's/toAscii/toLatin1/g' {} \;
}

build() {
  cd "$pkgname-${_pkgver%-*}"
  CFLAGS="$CFLAGS -DKIOSKHACK"
  qmake-qt5 PREFIX="$pkgdir/usr" DEFINES=USEUDISKS2 "$pkgname.pro"
  make
}

package() {
  cd "$pkgname-${_pkgver%-*}"
  make DESTDIR="$pkgdir/" install
}
