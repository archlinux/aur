# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=primerl
pkgver=2.4a
pkgrel=1
pkgdesc="A sci-fi roguelike, based on ZAPM."
arch=('i686' 'x86_64')
url="http://pesky-reticulans.org/"
license=('GPL')
depends=('ncurses' 'gcc-libs' 'libsigsegv' 'lua51' 'sdl_net' 'sdl_mixer')
makedepends=('fpc')  # whhhhyyyyy
source=("http://pesky-reticulans.org/game/prime_src-$pkgver.tar.bz2")
md5sums=('321beb1cff617d41b37ca33968512442')

build()
{
  cd "$srcdir/prime"
  sed -is 's/-llua /-llua5.1 /g' noteye/Makefile* makefile.base
  #sed -i 's/cp help/cp docs/' makefile.std
  sed -i 's/cp help/#&/' makefile.std
  sed -i 's/cp data/cp user/' makefile.std
  #sed -i 's/multi: multi-user /& nogui /' makefile.std
  #echo "#define NOGUI" >> config.h

  # the FPC stuff seems to be extremely baked-in
  # has difficulty linking Noteye, console only for now

  make -f makefile.std multiconsole
}

package()
{
  cd "$srcdir/prime"
  make PREFIX="$pkgdir" -f makefile.std install
  mkdir -p "$pkgdir/usr/bin/"
  ln -s /usr/games/bin/prime "$pkgdir/usr/bin/primerl"
  chmod -x "$pkgdir/var/games/prime/"*
  #install -Dm644 libnoteye.so "$pkgdir/usr/lib/libnoteye.so"
}

