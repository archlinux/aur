# Maintainer: archlinux.info:tdy

pkgbase=cutechess-git
pkgname=(cutechess-git cutechess-cli-git libcutechess-git libcutechess-git-docs)
pkgver=r1878.8d265fe
pkgrel=2
pkgdesc="Tools for working with chess engines"
arch=(i686 x86_64)
url=http://cutechess.com
license=(GPL3)
depends=(qt5-svg)
makedepends=(git doxygen)
source=($pkgbase::git+https://github.com/${pkgbase%-git}/${pkgbase/-/.})
sha256sums=(SKIP)

pkgver() {
  cd $pkgbase
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $pkgbase/projects
  sed -n '2,23s:^[ ]*::p' gui/components/pgnhighlighter/src/pgnhighlighter.h > COPYING.gui
  sed -n '2,23s:^[ ]*::p' lib/components/json/src/jsonparser.h > COPYING.lib
}

build() {
  cd $pkgbase
  qmake
  make
}

package_cutechess-git() {
  pkgdesc="A graphical interface for chess"
  license=(GPL3 MIT)
  provides=(${pkgname%-git})
  conflicts=(${pkgname%-git})
 
  cd $pkgbase/projects
  install -Dm755 gui/${pkgname%-git} "$pkgdir"/usr/bin/${pkgname%-git}
  install -Dm644 COPYING.gui "$pkgdir"/usr/share/licenses/$pkgname/COPYING
  install -Dm644 gui/res/icons/${pkgbase%-git}_32x32.xpm \
    "$pkgdir"/usr/share/pixmaps/${pkgbase%-git}_32x32.xpm
  install -Dm644 ../dist/linux/${pkgbase%-git}.desktop \
    "$pkgdir"/usr/share/applications/${pkgbase%-git}.desktop
}

package_cutechess-cli-git() {
  pkgdesc="A command-line tool to automate chess engine tournaments"
  depends=(qt5-base)
  provides=(${pkgname%-git})
  conflicts=(${pkgname%-git})

  cd $pkgbase
  install -Dm755 projects/cli/${pkgname%-git} "$pkgdir"/usr/bin/${pkgname%-git}
  install -Dm644 docs/${pkgname%-git}.6 "$pkgdir"/usr/share/man/man6/${pkgname%-git}.6
  install -Dm644 docs/engines.json.5 "$pkgdir"/usr/share/man/man5/engines.json.5
}

package_libcutechess-git() {
  pkgdesc="A static library for chess"
  license=(GPL3 MIT)
  depends=()
  options=(staticlibs)
  provides=(${pkgname%-git})
  conflicts=(${pkgname%-git})

  cd $pkgbase/projects
  install -Dm644 lib/${pkgname%-git}.a "$pkgdir"/usr/lib/${pkgname%-git}.a
  install -Dm644 COPYING.lib "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}

package_libcutechess-git-docs() {
  pkgdesc="API documentation for libcutechess"
  arch=(any)
  depends=()
  options=(docs)
  provides=(${pkgname%-git})
  conflicts=(${pkgname%-git})

  cd $pkgbase
  make doc-api
  install -dm755 "$pkgdir"/usr/share/doc/libcutechess/html/
  install -m644 docs/api/html/* "$pkgdir"/usr/share/doc/libcutechess/html/
  sed -i "s:$srcdir/$pkgbase/docs/api:/usr/share/libcutechess/html:g" \
    -s "$pkgdir"/usr/share/doc/libcutechess/html/*.html
}
