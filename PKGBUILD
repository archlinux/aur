# Maintainer: Lari Tikkanen <lartza at wippies.com>
# Contributor: Joshua Hunt <snark1994 at gmail dot com>
# Contributor: Joao Cordeiro <jlcordeiro at gmail dot com>
pkgname=unnethack
pkgver=5.2.0
pkgrel=1
pkgdesc="Variant of NetHack. It features more randomness, more levels, more challenges and more fun than vanilla NetHack."
arch=('i686' 'x86_64')
url="https://unnethack.wordpress.com"
license=('custom')
depends=('bash')
source=(https://github.com/UnNetHack/UnNetHack/archive/$pkgver.tar.gz)
sha256sums=('a5b2577d0caa721d0c9107c084e64ebb58041bc931c3f53f2fb02e70862d1232')

prepare() {
  cd "$srcdir/UnNetHack-$pkgver"
  sed -e "s/GAMEUID  = @OWNER@/GAMEUID  = root/g" \
      -e "s/GAMEGRP  = @GROUP@/GAMEGRP  = games/g" \
      -e "s/GAMEPERM = 04755/GAMEPERM = 02775/g" \
      -e "s/VARFILEPERM = 0644/VARFILEPERM = 0664/g" \
      -e "s/VARDIRPERM  = 0755/VARDIRPERM  = 0775/g" -i sys/autoconf/Makefile.top
}

build() {
  cd "$srcdir/UnNetHack-$pkgver"

  ./configure --prefix=/usr --with-gamesdir=/var/games/unnethack --with-owner=`id -un` --enable-curses-graphics
  make
}

package(){
  cd "$srcdir/UnNetHack-$pkgver"

  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install manpages

  chown -R root:root "$pkgdir/usr/"
  chown root:games "$pkgdir/usr/share/unnethack/unnethack"
  chmod 775 "$pkgdir/var/games/"

  install -D -m 644 dat/license "$pkgdir/usr/share/licenses/$pkgname/license"
}
