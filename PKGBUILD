# Maintainer: Lari Tikkanen <lartza at wippies.com>
# Contributor: Joshua Hunt <snark1994 at gmail dot com>
# Contributor: Joao Cordeiro <jlcordeiro at gmail dot com>
pkgname=unnethack
pkgver=5.3.2
pkgrel=1
pkgdesc="Variant of NetHack. It features more randomness, more levels, more challenges and more fun than vanilla NetHack."
arch=('i686' 'x86_64')
url="https://unnethack.wordpress.com"
license=('custom')
depends=('bash')
source=(https://github.com/UnNetHack/UnNetHack/archive/$pkgver.tar.gz)
sha256sums=('a32a2c0e758eb91842033d53d43f718f3bc719a346e993d9b23bac06f0ac9004')

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
