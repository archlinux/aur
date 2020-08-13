# Maintainer: archlinux.info:tdy

pkgbase=cutechess
pkgname=(cutechess cutechess-cli libcutechess libcutechess-docs)
pkgver=1.2.0
pkgrel=1
pkgdesc="Tools for working with chess engines"
arch=(i686 x86_64)
url=http://cutechess.com
license=(GPL3)
depends=(qt5-svg)
makedepends=(doxygen)
source=(https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz)
sha256sums=('d0e1b2c9c2eaccf0f8c4d5e5fe7e169358f5de9606bd27de3f9d1ce4ddcdb0bc')

prepare() {
  cd $pkgbase-$pkgver/projects
  sed -n '2,23s:^[ ]*::p' gui/components/pgnhighlighter/src/pgnhighlighter.h > COPYING.gui
  sed -n '2,23s:^[ ]*::p' lib/components/json/src/jsonparser.h > COPYING.lib
}

build() {
  cd $pkgbase-$pkgver
  qmake
  make
}

package_cutechess() {
  pkgdesc="A graphical interface for chess"
  license=(GPL3 MIT)

  cd $pkgbase-$pkgver/projects
  install -Dm755 gui/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 COPYING.gui "$pkgdir"/usr/share/licenses/$pkgname/COPYING
  install -Dm644 gui/res/icons/${pkgname}_32x32.xpm \
    "$pkgdir"/usr/share/pixmaps/${pkgname}_32x32.xpm
  install -Dm644 ../dist/linux/$pkgname.desktop \
    "$pkgdir"/usr/share/applications/$pkgname.desktop
}

package_cutechess-cli() {
  pkgdesc="A command-line tool to automate chess engine tournaments"
  depends=(qt5-base)

  cd $pkgbase-$pkgver
  install -Dm755 projects/cli/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 docs/$pkgname.6 "$pkgdir"/usr/share/man/man6/$pkgname.6
  install -Dm644 docs/engines.json.5 "$pkgdir"/usr/share/man/man5/engines.json.5
}

package_libcutechess() {
  pkgdesc="A static library for chess"
  license=(GPL3 MIT)
  depends=()
  options=(staticlibs)

  cd $pkgbase-$pkgver/projects
  install -Dm644 lib/$pkgname.a "$pkgdir"/usr/lib/$pkgname.a
  install -Dm644 COPYING.lib "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}

package_libcutechess-docs() {
  pkgdesc="API documentation for libcutechess"
  arch=(any)
  depends=()
  options=(docs)

  cd $pkgbase-$pkgver
  make doc-api
  install -dm755 "$pkgdir"/usr/share/doc/${pkgname%-*}/html/
  install -m644 docs/api/html/* "$pkgdir"/usr/share/doc/${pkgname%-*}/html/
  sed -i "s:$srcdir/$pkgbase-gui-$pkgver/docs/api:/usr/share/${pkgname%-*}/html:g" \
    -s "$pkgdir"/usr/share/doc/${pkgname%-*}/html/*.html
}
