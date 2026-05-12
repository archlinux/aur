# Maintainer: Chris Charabaruk <chris [at] charabaruk [dot] net>

pkgname=biblioteq
pkgver=2026.05.12
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
sha256sums=('42d8a326cfbfde91a819fd68a16b8be29c7d2e04fdee35a70732b3fc16ccc5e1')

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
