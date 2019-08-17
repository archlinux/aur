# Maintainer: Lari Tikkanen <lartza@wippies.com>
pkgname=unnethack-git
pkgver=5.1.0.20131208.r326.g62f5a0e7
pkgrel=1
pkgdesc="Variant of NetHack. It features more randomness, more levels, more challenges and more fun than vanilla NetHack."
arch=('i686' 'x86_64')
url="https://unnethack.wordpress.com/"
license=('custom')
depends=('bash')
makedepends=('git')
provides=(unnethack)
conflicts=(unnethack)
source=("$pkgname::git+https://github.com/UnNetHack/UnNetHack.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$pkgname"
  sed -e "s/GAMEUID  = @OWNER@/GAMEUID  = root/g" \
      -e "s/GAMEGRP  = @GROUP@/GAMEGRP  = games/g" \
      -e "s/GAMEPERM = 04755/GAMEPERM = 02775/g" \
      -e "s/VARFILEPERM = 0644/VARFILEPERM = 0664/g" \
      -e "s/VARDIRPERM  = 0755/VARDIRPERM  = 0775/g" -i sys/autoconf/Makefile.top
}

build() {
  cd "$pkgname"
  ./configure --prefix=/usr --with-gamesdir=/var/games/unnethack --with-owner=`id -un` --enable-curses-graphics
  make
}

package () {
  cd "$pkgname"

  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install manpages

  chown -R root:root "$pkgdir/usr/"
  chown root:games "$pkgdir/usr/share/unnethack/unnethack"
  chmod 775 "$pkgdir/var/games/"

  install -D -m 644 dat/license "$pkgdir/usr/share/licenses/$pkgname/license"
}


