# Maintainer: dx <dx at dxzone.com.ar>
# Contributor: Boohbah <boohbah at gmail.com>
# Contributor: Eric Belanger <eric at archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227 at archlinux.us>

_pkgname=htop
pkgname=$_pkgname-blueweb
pkgver=1.0.3
pkgrel=1
pkgdesc="Interactive process viewer with blueweb theme patch"
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
        'htop-blueweb-theme-1.0.3.patch')
md5sums=('e768b9b55c033d9c1dffda72db3a6ac7'
         'eddab24184b8681acaac70e2c35eb318')

prepare() {
  cd "$_pkgname-$pkgver"

  sed -i 's|ncursesw/curses.h|curses.h|' RichString.[ch] configure
  sed -i 's|python|python2|' scripts/MakeHeader.py
}

build() {
  cd "$_pkgname-$pkgver"

  # Blueweb patch
  patch -N -i ../htop-blueweb-theme-1.0.3.patch

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
