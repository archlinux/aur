# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>
# Contributor: Vladimir Cerny <blackvladimir@gmail.com>

pkgname=free42
pkgver=1.5.15
pkgrel=1
pkgdesc="A complete re-implementation of the HP-42S calculator and the HP-82240 printer"
arch=('i686' 'x86_64')
url="http://thomasokken.com/free42/"
license=('GPL')
depends=('libxmu' 'gtk2')
source=("http://thomasokken.com/free42/upstream/$pkgname-nologo-$pkgver.tgz")
md5sums=('513b4a237c5f9672a741dc12f1d5402f')

prepare() {
  cd "$srcdir/$pkgname-nologo-$pkgver/gtk"

  echo 'LIBS := ${LIBS} -lX11' >> Makefile
  sed -i 's/Wno-write-strings \\/&\n\t -Wno-narrowing \\/' Makefile
}

build() {
  cd "$srcdir/$pkgname-nologo-$pkgver/gtk"

  # build both bin and dec version
  make cleaner
  make
  make clean
  make BCD_MATH=1
}

package() {
  cd "$srcdir/$pkgname-nologo-$pkgver/gtk"

  install -Dm755 free42bin "$pkgdir/usr/bin/free42bin"
  install -Dm755 free42dec "$pkgdir/usr/bin/free42dec"

  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README_GTK"
  install -Dm644 ../README "$pkgdir/usr/share/doc/$pkgname/README"

  ln -s /usr/bin/free42dec "$pkgdir/usr/bin/free42"

  cd ../skins
  for _f in *; do
    install -Dm644 $_f "$pkgdir/usr/share/$pkgname/skins/$_f"
  done
}

# vim:set ts=2 sw=2 et:
