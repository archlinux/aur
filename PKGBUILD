# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: andmars <andreas.marschall @ unitybox.de>
# Contributor: SaThaRiel <sathariel74[at] gmail[dot]com>
pkgname=angband-git
pkgver=4.1.3.r217.ga8941c1d
pkgrel=1
pkgdesc="A roguelike dungeon-exploration game based on Tolkien's books"
arch=('i686' 'x86_64')
url="http://rephial.org/"
license=('GPL2' 'custom')
depends=('sdl_image' 'sdl_ttf' 'sdl_mixer')
makedepends=('git' 'autogen' 'python-docutils')
conflicts=('angband' 'angband-svn')
source=("$pkgname"::'git+https://github.com/angband/angband.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname"
  ./autogen.sh

  # Fix detection of ncurses config script for ncurses 6.0
  sed -i 's/ncursesw5-config/ncursesw6-config/g' acinclude.m4
}

build() {
  cd "$srcdir/$pkgname"
  ./configure \
    --prefix=/usr \
    --bindir=/usr/bin/ \
    --sysconfdir=/usr/share/angband \
    --with-configpath=/usr/share/angband \
    --with-libpath=/usr/share/angband \
    --enable-gtk \
    --enable-sdl \
    --enable-sdl-mixer
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
  rm -f "$pkgdir"/usr/share/angband/*/delete.me
  install -Dm644 copying.txt "$pkgdir"/usr/share/licenses/$pkgname/COPYING
  install -d "$pkgdir"/usr/bin
}
