# Maintainer: Lari Tikkanen <lartza at outlook.com>
# Contributor: Joshua Hunt <snark1994 at gmail dot com>
# Contributor: Joao Cordeiro <jlcordeiro at gmail dot com>
pkgname=unnethack
pkgver=5.3.2
pkgrel=2
pkgdesc="Variant of NetHack. It features more randomness, more levels, more challenges and more fun than vanilla NetHack."
arch=('i686' 'x86_64')
url="https://unnethack.wordpress.com"
license=('custom')
depends=('bash')
source=(https://github.com/UnNetHack/UnNetHack/archive/$pkgver.tar.gz
        https://github.com/UnNetHack/UnNetHack/commit/04f0a3a850a94eb8837ddcef31303968240d1c31.patch)
sha256sums=('a32a2c0e758eb91842033d53d43f718f3bc719a346e993d9b23bac06f0ac9004'
            '0b88737eba9a8028bcf8a886f36f66b3920b4d1eb03847088ed4e350d5327d7f')

prepare() {
  cd "$srcdir/UnNetHack-$pkgver"
  sed -e "s/GAMEUID  = @OWNER@/GAMEUID  = root/g" \
      -e "s/GAMEGRP  = @GROUP@/GAMEGRP  = games/g" \
      -e "s/GAMEPERM = 04755/GAMEPERM = 02775/g" \
      -e "s/VARFILEPERM = 0644/VARFILEPERM = 0664/g" \
      -e "s/VARDIRPERM  = 0755/VARDIRPERM  = 0775/g" -i sys/autoconf/Makefile.top

  patch -Np1 -i "$srcdir/04f0a3a850a94eb8837ddcef31303968240d1c31.patch"
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
