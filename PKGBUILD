# Maintainer: Chris Charabaruk <chris [at] charabaruk [dot] net>

pkgname=biblioteq
pkgver=2025.05.17
pkgrel=1
pkgdesc="Qt application for library catalog and membership management"
arch=('x86_64')
url="https://textbrowser.github.io/biblioteq/"
license=('BSD-3-Clause')
depends=('qt6-base'
         'qt6-multimedia'
         'qt6-webengine'
         'poppler-qt6'
         'yaz'
         'gcc-libs')
makedepends=('qt6-tools')
optdepends=('postgresql-libs: PostgreSQL database connectivity')
source=("$pkgname-$pkgver.tar.gz::https://github.com/textbrowser/biblioteq/archive/$pkgver.tar.gz")
sha256sums=('9b6a72c3e502f5e2e765d09793beb0797271569d085340e1385b81f4f4c8b8cb')

build() {
  cd "$pkgname-$pkgver"
  qmake6 -o Makefile biblioteq.pro
  make
}

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/opt/$pkgname"

  install -t "$pkgdir/opt/$pkgname" ./BiblioteQ ./biblioteq.sh
  install -m 644 -t "$pkgdir/opt/$pkgname" ./biblioteq.conf ./Icons/book.png

  # Install supporting data (SQLite and CSV templates)
  install -Dm 644 -t "$pkgdir/opt/$pkgname/Data" ./Data/*

  # Install SQL scripts for PostgreSQL
  install -Dm 644 -t "$pkgdir/opt/$pkgname/SQL" ./SQL/*
  chmod a+x "$pkgdir/opt/$pkgname/SQL"/*.sh

  # Install documentation (except for code docs)
  install -d "$pkgdir/opt/$pkgname/Documentation"
  cp -pr ./Documentation/* "$pkgdir/opt/$pkgname/Documentation"
  rm -fr "$pkgdir/opt/$pkgname/Documentation/Doxygen"
  chown -RP root:root "$pkgdir/opt/$pkgname/Documentation"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

  install -Dm 644 -t "$pkgdir/usr/share/applications" ./Distributions/biblioteq.desktop
  install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname/" ./LICENSE
}
