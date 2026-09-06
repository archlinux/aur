# Maintainer: Sergius <sergius AT sarbs DOT xyz>

_gitname=ls_extended
pkgname=sarbs-ls_extended-git
pkgver=2026.09.06.r183.gb46388d
pkgrel=1
pkgdesc="Minimalistischer ls-Ersatz mit Nerd-Font-Icons, Farben und Sortieroptionen (Fork, Teil von SARBS)"
arch=('x86_64')
url="https://codeberg.org/Sergius/ls_extended"
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('git')
provides=("ls_extended=$pkgver")
conflicts=('ls_extended')
source=("git+$url")
sha256sums=('SKIP')
options=(!debug)

pkgver() {
  cd "$_gitname"
  printf "%s.r%s.g%s" "$(git log -1 --format=%cd --date=format:'%Y.%m.%d')" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_gitname"
  make clean
  make CFLAGS="$CFLAGS -std=gnu99 -Wall -Wextra" LDFLAGS="$LDFLAGS" PREFIX=/usr
}

package() {
  cd "$_gitname"
  # Das Makefile unterstützt kein DESTDIR, daher PREFIX direkt in $pkgdir
  make CFLAGS="$CFLAGS -std=gnu99 -Wall -Wextra" LDFLAGS="$LDFLAGS" \
    PREFIX="$pkgdir/usr" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
