# Maintainer: Boohbah <boohbah at gmail.com>
# Contributor: Eric Belanger <eric at archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227 at archlinux.us>
# Contributor: Wesley Merkel <ooesili at gmail.com>
# Contributor: sekret <sekret at posteo.se>

_pkgname=htop
pkgname=$_pkgname-solarized
pkgver=2.0.0
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
        "htop-$pkgver-solarized.patch")
sha512sums=('2df1b96e4c07a1de360dc7b7b20db0e663d7fa2c9a8a9dcc3d7dc1ce5e5b59f72d927e8e7ae919631cf0e950a82450b45116a1f8d788f63c5762bd73332ec32c'
            'd221942ea7843e802cfbbe01f24805944d831148eefc6a7a0bab38e883970bd6598a2e76ff45286566d732df0b193ef33451956d210bd4f44752336cadc79c57')

prepare() {
  cd "$_pkgname-$pkgver"

  sed -i 's|ncursesw/curses.h|curses.h|' RichString.[ch] configure
  sed -i 's|python|python2|' scripts/MakeHeader.py

  # Solarized patch: https://gist.github.com/ooesili/11292686
  patch -p1 -N -i "../htop-$pkgver-solarized.patch"
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
