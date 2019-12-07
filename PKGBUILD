# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>
# Contributor: Vladimir Cerny <blackvladimir@gmail.com>

pkgname=free42
pkgver=2.5.12a
pkgrel=2
pkgdesc="A complete re-implementation of the HP-42S calculator and the HP-82240 printer"
arch=('i686' 'x86_64')
url="http://thomasokken.com/free42/"
license=('GPL')
depends=('gtk3')
optdepends=('free42-skins: Additional skins')
source=("http://thomasokken.com/free42/upstream/$pkgname-nologo-$pkgver.tgz"
        "0001_system-skins.patch"
        "free42.desktop")
md5sums=('cb417d71d440fce18a1e3c208b6093d9'
         '8c0522e3efa3c7fd54985af456b689b7'
         '9e1af9bfd8ce5eb2ad107f63ea446a55')

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

  install -Dm644 icon-48x48.xpm "$pkgdir/usr/share/icons/hicolor/48x48/apps/free42.xpm"
  install -Dm644 icon-128x128.xpm "$pkgdir/usr/share/icons/hicolor/128x128/apps/free42.xpm"

  ln -s /usr/bin/free42dec "$pkgdir/usr/bin/free42"

  cd ../skins
  for _f in Ehrling42sl.* Standard.* README.txt; do
    install -Dm644 $_f "$pkgdir/usr/share/$pkgname/skins/$_f"
  done

  install -Dm644 "$srcdir/free42.desktop" "$pkgdir/usr/share/applications/free42.desktop"
}

# vim:set ts=2 sw=2 et:
