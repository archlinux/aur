# Maintainer: Boohbah <boohbah at gmail.com>
# Contributor: Eric Belanger <eric at archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227 at archlinux.us>
# Contributor: Wesley Merkel <ooesili at gmail.com>
# Contributor: sekret <sekret at posteo.se>

_pkgname=htop
pkgname=$_pkgname-solarized
pkgver=2.0.2
pkgrel=1
pkgdesc="Interactive process viewer with solarized patch"
arch=('i686' 'x86_64' 'armv7h')
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
        'htop-2.0.1-solarized.patch')
sha512sums=('1c9bf71a36c56b301667aa6d03756fc757fbcb63e848d9581d10db3df6193cdeb00e55ceb6e2392794ac03ea034b04459a8fe550b3ac2318cd86263a74c78cda'
            'd221942ea7843e802cfbbe01f24805944d831148eefc6a7a0bab38e883970bd6598a2e76ff45286566d732df0b193ef33451956d210bd4f44752336cadc79c57')

prepare() {
  cd "$_pkgname-$pkgver"

  sed -i 's|ncursesw/curses.h|curses.h|' RichString.[ch] configure
  sed -i 's|python|python2|' scripts/MakeHeader.py

  # Solarized patch: https://gist.github.com/ooesili/11292686
  patch -p1 -N -i "$srcdir/htop-2.0.1-solarized.patch"
}

build() {
  cd "$_pkgname-$pkgver"

  ./configure \
      --prefix=/usr \
      --enable-unicode \
      --enable-openvz \
      --enable-vserver \
      --enable-cgroup \
      --enable-oom

  make
}

package() {
  make -C "$_pkgname-$pkgver" DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
