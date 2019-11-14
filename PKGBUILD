# Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>

# flashback_data_files.7z if from http://gtamp.com/PSP/reminiscencepsp.php

pkgname=reminiscence
pkgver=0.4.5
pkgrel=1
pkgdesc="A rewrite of the flashback engine"
arch=('i686' 'x86_64')
url="http://cyxdown.free.fr/reminiscence/"
license=('GPL')
depends=('sdl2' 'libmodplug' 'zlib' 'bash' 'libtremor-svn')
makedepends=('p7zip' 'patch')
source=(http://cyxdown.free.fr/reminiscence/REminiscence-${pkgver}.tar.bz2
        http://gtamp.com/PSP/flashback_data_files.7z
        reminiscence.sh
        fix-makefile.patch)
md5sums=('ebdb0027c77fceae39b4edfb1b231adc'
         'f994412ad4246c587896dab7d2eb9627'
         '4ed0350e4b81e9ba305f90e157c75371'
         '4e0815ccd056c38ab694ca77c03fac51')
noextract=('flashback_data_files.7z')

build() {
  cd "$srcdir/REminiscence-$pkgver"

  patch -p1 -i $srcdir/fix-makefile.patch

  make CXX=g++ CXXFLAGS="-Wall -MMD \$(SDL_CFLAGS) -DUSE_MODPLUG -DUSE_ZLIB -O"
}

package() {
  cd "$srcdir/REminiscence-$pkgver"

  #install -d "$pkgdir/usr/bin"
  install -Dm755 rs "$pkgdir/usr/bin/reminiscence.bin"
  install -Dm755 "$srcdir/reminiscence.sh" "$pkgdir/usr/bin/reminiscence"

  msg2 "Extracting flashback_data_files.7z with p7zip"
  install -m755 -d "$pkgdir/usr/share/reminiscence"
  7z x "$srcdir/flashback_data_files.7z" -o"$pkgdir/usr/share/reminiscence" -y >/dev/null
}

# vim:set ts=2 sw=2 et:
