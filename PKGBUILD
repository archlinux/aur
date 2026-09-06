# Maintainer: Sergius <sergius AT sarbs DOT xyz>

_pkgname=dwm
pkgname=sarbs-dwm-git
pkgver=2026.09.06.r2013.gb620988
pkgrel=1
pkgdesc="Sergi's build of dwm (Teil von SARBS)"
arch=('x86_64')
url="https://codeberg.org/Sergius/dwm"
license=('MIT')
depends=('libx11' 'libxft' 'libxinerama' 'freetype2')
makedepends=('git')
provides=("dwm")
conflicts=("dwm")
source=("git+https://codeberg.org/Sergius/dwm")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "%s.r%s.g%s" "$(git log -1 --format=%cd --date=format:'%Y.%m.%d')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  # Support CFLAGS, LDFLAGS, etc.
  sed -i 's/^CPPFLAGS =/CPPFLAGS +=/' config.mk
  sed -i 's/^CFLAGS   =/CFLAGS   +=/' config.mk
  sed -i 's/^LDFLAGS  =/LDFLAGS  +=/' config.mk
}

build() {
  cd "$_pkgname"
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd "$_pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
