# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: shimi <shimi.chen@gmail.com>
# Contributor: Dmytro Meleshko <dmytro.meleshko@gmail.com>
pkgname=imagewriter
_pkgver=1.10.1432200249.1d253d9-2.18
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A graphical utility for writing raw disk images & hybrid isos to USB keys"
arch=('x86_64')
url="https://github.com/openSUSE/imagewriter"
license=('GPL-2.0-or-later')
depends=('qt5-base' 'udisks2')
source=("https://download.opensuse.org/tumbleweed/repo/src-oss/src/$pkgname-${_pkgver}.src.rpm")
sha256sums=('33e312c01daacb99838b0abdf8d4b850e38df18ab2dfb24e00619a5813e91988')

prepare() {
  bsdtar xvf "$pkgname-${_pkgver%-*}.tar.xz"

  cd "$pkgname-${_pkgver%-*}"
  patch -Np1 -i ../0001-remove-include-sys-sysctl.h.patch

  # Replace calls to deprecated toAscii method with calls to toLatin1
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
