# Maintainer: Lari Tikkanen <lartza@wippies.com>
pkgname=unnethack-git
pkgver=5.1.0.20131208.r67.g0dc7b47
pkgrel=1
pkgdesc="Variant of NetHack. It features more randomness, more levels, more challenges and more fun than vanilla NetHack."
arch=('i686' 'x86_64')
url="http://sourceforge.net/apps/trac/unnethack/"
license=('custom')
depends=('bash')
makedepends=('git')
provides=(unnethack)
conflicts=(unnethack)
source=("$pkgname::git://git.code.sf.net/p/unnethack/git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd $srcdir/$pkgname
  ./configure --bindir=/usr/bin --prefix=/usr/share/unnethack --with-owner=`id -un` --with-group=`id -gn` --enable-wizmode=`id -un` --enable-curses-graphics
  make
}

package () {
  cd $srcdir/$pkgname
  make DESTDIR="$pkgdir" install
  install -D -m 644 dat/license "$pkgdir/usr/share/licenses/$pkgname/license"
}


