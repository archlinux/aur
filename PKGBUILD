# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=plus42
pkgver=1.0.15
pkgrel=1
pkgdesc="Advanced scientific programmable calculator, based on Free42"
arch=('x86_64')
url="https://thomasokken.com/plus42/"
license=('GPL')
depends=('gtk3')
source=("http://thomasokken.com/plus42/upstream/$pkgname-upstream-$pkgver.tgz"
        "plus42.desktop")
md5sums=('d2279da1dbd76b5ab49a116a2ed7317d'
         'ba6d9ff8d83e9a244b5da63acbfc018e')

build() {
  cd "$srcdir/$pkgname-upstream-$pkgver/gtk"

  # build both bin and dec version
  make cleaner
  make
  make clean
  make BCD_MATH=1
}

package() {
  cd "$srcdir/$pkgname-upstream-$pkgver/gtk"

  install -Dm755 plus42bin "$pkgdir/usr/bin/plus42bin"
  install -Dm755 plus42dec "$pkgdir/usr/bin/plus42dec"

  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README_GTK"
  install -Dm644 ../README "$pkgdir/usr/share/doc/$pkgname/README"

  install -Dm644 icon-48x48.xpm "$pkgdir/usr/share/icons/hicolor/48x48/apps/plus42.xpm"
  install -Dm644 icon-128x128.xpm "$pkgdir/usr/share/icons/hicolor/128x128/apps/plus42.xpm"

  ln -s /usr/bin/plus42dec "$pkgdir/usr/bin/plus42"

  cd ../skins
  for x in Plus42.* README.txt; do
    install -Dm644 $x "$pkgdir/usr/share/$pkgname/skins/$x"
  done

  install -Dm644 "$srcdir/plus42.desktop" "$pkgdir/usr/share/applications/com.thomasokken.plus42.desktop"
}
