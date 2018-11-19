# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=hunspell-git
pkgver=1.7.0.r0.g4ddd8ed
pkgrel=1
pkgdesc="The most popular spellchecking library"
arch=('i686' 'x86_64')
url="https://hunspell.github.io/"
license=('LGPL')
depends=('glibc' 'ncurses' 'readline')
makedepends=('git')
optdepends=('perl: for ispellaff2myspell')
provides=('hunspell')
conflicts=('hunspell')
options=('staticlibs')
source=("git+https://github.com/hunspell/hunspell.git")
sha256sums=('SKIP')


pkgver() {
  cd "hunspell"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "hunspell"

  autoreconf -fi
  ./configure \
    --prefix="/usr" \
    --with-readline \
    --with-ui
  make
}

check() {
  cd "hunspell"

  make check
}

package() {
  cd "hunspell"

  make DESTDIR="$pkgdir" install

  # add generic hunspell.so for development and projects not using pkgconfig flags - FS#30592
  cd "$pkgdir/usr/lib"
  ln -s libhunspell-?.?.so "libhunspell.so"
}
