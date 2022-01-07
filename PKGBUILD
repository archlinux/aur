# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: shimi <shimi.chen@gmail.com>
# Contributor: Dmytro Meleshko <dmytro.meleshko@gmail.com>
pkgname=imagewriter
_pkgver=1.10.1432200249.1d253d9-2.10
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A graphical utility for writing raw disk images & hybrid isos to USB keys"
arch=('x86_64')
url="https://github.com/openSUSE/imagewriter"
license=('GPL2')
depends=('qt5-base' 'udisks2')
source=("http://download.opensuse.org/tumbleweed/repo/src-oss/src/$pkgname-$_pkgver.src.rpm")
sha256sums=('3400e0a9483698561d552ec24ccf6d20bc970599818baf3cb71f15dda2a59541')

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
