# Maintainer : catskillmarina <catskillmarina @ gmail.com>

pkgname=wanderer-git
pkgver=20160106.4
pkgrel=1.2
pkgdesc='Wanderer is a game like Boulderdash, Repton, XOR in git for active development. (wanderer)'
arch=('any')
url="http://e271.net/~marina/wanderer"
license=('GPL')
depends=('ncurses')
makedepends=('git')
source=("$pkgname::git+https://github.com/catskillmarina/wanderer-dev.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
}

prepare() {
  pwd
  cd "$srcdir/$pkgname"
  pwd
  sed -e "s|/usr/local/share/wanderer/screens|/usr/share/wanderer/screens|" \
      -e "s|/* #define NO_ENCRYPTION |#define NO_ENCRYPTION |" -i wand_head.h
}

build(){
  cd "$srcdir/$pkgname"
  make
  pwd
}
  
package() {
  cd "$srcdir/$pkgname"
  pwd
  install -m 0755 -d -o root -g games "$pkgdir/usr/share/wanderer"
  install -m 0755 -d -o root -g games "$pkgdir/usr/share/wanderer/screens"
  install -m 0644 -o root -g games screens/* "$pkgdir/usr/share/wanderer/screens/"

  install -dm775 $pkgdir/var/games/
  # FS#43414: /var/games should be owned by root:games.
  # copied from nethack
  chown -R root:games $pkgdir/var/games/

  install -Dm2755 wanderer "$pkgdir/usr/bin/wanderer"
  # install -Dm655 wandererscores "$pkgdir/var/games/wandererscores
  chown root:games "$pkgdir/usr/bin/wanderer"
  chmod g+s "$pkgdir/usr/bin/wanderer"
  install -Dm644 wanderer.6 "$pkgdir/usr/share/man/man6/wanderer.6"
}

