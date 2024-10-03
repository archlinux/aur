# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>
# Maintainer: rafaelff <rafaelff@gnome.org>

pkgname=sudokuki
pkgver=1.2.4
pkgrel=3
pkgdesc="A free graphical sudoku game written in Java"
arch=('any')
url="http://sudokuki.sourceforge.net/"
license=('GPL-3.0-or-later')
depends=('java-runtime')
makedepends=('java-environment')
options=('!emptydirs' '!libtool')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2"
        "sudokuki.desktop")
sha256sums=('ecaed07651ce96888815a046e2f25c54a2fcb926823da0fa77b7250fe7d1a9f1'
            '9ed7e72e9f9447b9556c2497e3c0c92e3c86e635e59b1a86c974a6016a2f03c6')

prepare() {
  cd $pkgname-$pkgver
  # Enable translation files compilation
  sed -i 's|^# GMOFILES|GMOFILES|' po/Makefile.in.in
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make -C po update-po
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" noinst_libdir="" install

  # Install .desktop file
  install -Dm644 src/resources/files/net/jankenpoi/sudokuki/resources/images/logo.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 "$srcdir"/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop

  # Install a readme file
  install -Dm644 README "$pkgdir"/usr/share/doc/$pkgname/README
}
