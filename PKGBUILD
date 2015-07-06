# Maintainer: Boohbah <boohbah at gmail.com>
# Contributor: Eric Belanger <eric at archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227 at archlinux.us>
# Contributor: Wesley Merkel <ooesili at gmail.com>

_pkgname=htop
pkgname=$_pkgname-solarized
pkgver=1.0.3
pkgrel=1
pkgdesc="Interactive process viewer with solarized patch"
arch=('i686' 'x86_64')
url="http://htop.sourceforge.net/"
license=('GPL')
depends=('ncurses')
makedepends=('python2')
optdepends=('lsof: show files opened by a process'
            'strace: attach to a running process')
provides=('htop')
conflicts=('htop')
options=('!emptydirs')
source=("http://hisham.hm/$_pkgname/releases/$pkgver/$_pkgname-$pkgver.tar.gz"
        'htop-1.0.3-solarized.patch')
sha512sums=('4c5c784b093bcad06eb2e8d8bb215e14f6e838a3d47d8da8402344c270c1724f85d0bcde2899571ba5d0e5a02274a0c3390a76fed61785b2604b51351f08f232'
            '1e1eed2ca1f1d7908f125dd04165b84c722e23d45df4162c98e521312b7736daa88eca70e92f181d2058ad686ed0e4bdcaf95de079d1c04cbd0ed125dd341223')

prepare() {
  cd "$_pkgname-$pkgver"

  sed -i 's|ncursesw/curses.h|curses.h|' RichString.[ch] configure
  sed -i 's|python|python2|' scripts/MakeHeader.py

  # Solarized patch: https://gist.github.com/ooesili/11292686
  patch -p1 -N -i ../htop-1.0.3-solarized.patch
}

build() {
  cd "$_pkgname-$pkgver"

  ./configure \
      --prefix=/usr \
      --enable-unicode \
      --enable-openvz \
      --enable-vserver \
      --enable-cgroup

  make
}

package() {
  make -C "$_pkgname-$pkgver" DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
