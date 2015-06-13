# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=haserl
pkgver=0.9.33
pkgrel=1
pkgdesc="Tiny dynamic CGI web server with your shell or Lua."
arch=('i686' 'x86_64')
url="http://haserl.sourceforge.net"
_watch="http://sourceforge.net/projects/haserl/files/"
license=('GPL2')
depends=('sh' 'lua')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('a9decddb508944d56f71dd2f821e2ec5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  # lua51 also supported, see INSTALL
  ./configure prefix="$pkgdir/usr" --enable-luashell --enable-luacshell --disable-bashshell --disable-bash-extensions --with-lua
  make
  mv src/haserl haserl-lua

  ./configure prefix="$pkgdir/usr" --disable-luashell --disable-luacshell --enable-bashshell --enable-bash-extensions --without-lua
  make
  mv src/haserl haserl-sh
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  # make install is not friendly to installing both
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/man/man1"
  install -Dm644 doc/haserl.1 "$pkgdir/usr/share/man/man1/"

  install -Dm755 haserl-lua "$pkgdir/usr/bin/haserl-lua"
  install -Dm755 haserl-sh "$pkgdir/usr/bin/haserl-sh"

  ln -s "/usr/bin/haserl-sh" "$pkgdir/usr/bin/haserl"
}


