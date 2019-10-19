# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>
# Contributor: Vladimir Cerny <blackvladimir@gmail.com>

pkgname=free42
pkgver=2.5.10
pkgrel=1
pkgdesc="A complete re-implementation of the HP-42S calculator and the HP-82240 printer"
arch=('i686' 'x86_64')
url="http://thomasokken.com/free42/"
license=('GPL')
depends=('libxmu' 'gtk2')
optdepends=('free42-skins: Additional skins')
source=("http://thomasokken.com/free42/upstream/$pkgname-nologo-$pkgver.tgz"
        "0001_system-skins.patch")
md5sums=('a1686f5b68a9de097f2504096258cc8c'
         '8c0522e3efa3c7fd54985af456b689b7')

prepare() {
  cd "$srcdir/$pkgname-nologo-$pkgver/"

  # Read skins from system-wide directory (see package "free42-skins")
  # This patch can be removed if you want the original upstream version
  patch -Np1 -i "$srcdir/0001_system-skins.patch"
}

build() {
  cd "$srcdir/$pkgname-nologo-$pkgver/gtk"

  # build both bin and dec version
  make cleaner
  make SKIN_SYS_DIR="/usr/share/free42/skins"
  make clean
  make BCD_MATH=1 SKIN_SYS_DIR="/usr/share/free42/skins"
}

package() {
  cd "$srcdir/$pkgname-nologo-$pkgver/gtk"

  install -Dm755 free42bin "$pkgdir/usr/bin/free42bin"
  install -Dm755 free42dec "$pkgdir/usr/bin/free42dec"

  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README_GTK"
  install -Dm644 ../README "$pkgdir/usr/share/doc/$pkgname/README"

  ln -s /usr/bin/free42dec "$pkgdir/usr/bin/free42"

  cd ../skins
  for _f in Ehrling42sl.* Standard.* README.txt; do
    install -Dm644 $_f "$pkgdir/usr/share/$pkgname/skins/$_f"
  done
}

# vim:set ts=2 sw=2 et:
