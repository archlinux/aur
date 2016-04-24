# Contributor: Louis-Guillaume Gagnon <louis.guillaume.gagnon@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gambit-c-git
pkgver=4.8.5.r11.g67697c1
pkgrel=1
pkgdesc="Scheme R5RS interpreter and compiler (via C) - git version"
arch=('i686' 'x86_64')
url="http://gambitscheme.org"
license=('Apache' 'LGPL2.1')
depends=('bash')
makedepends=('git')
provides=('gambit-c')
conflicts=('gambit-c')
install="$pkgname.install"
options=('!makeflags' 'staticlibs')
source=(gambit-scheme::git+https://github.com/feeley/gambit.git)
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/gambit-scheme"
    git describe --tags|sed 's+-+.r+'| sed 's+-+.+' | cut -c2-
}

build() {
  LANG=C
  cd "$srcdir/gambit-scheme"
  ./configure \
      --prefix=/usr \
      --docdir=/usr/share/gambit-c \
      --infodir=/usr/share/info \
      --libdir=/usr/lib/gambit-c \
      --enable-c-opt \
      --enable-gcc-opts \
      --enable-single-host \
      --disable-shared \
      --enable-compiler-name=gambitc \
      --enable-interpreter-name=gambiti 
    make from-scratch
}

check() {
  cd "$srcdir/gambit-scheme"
  make check
}

package() {
  cd "$srcdir/gambit-scheme"
  make DESTDIR="$pkgdir/" install
  ln -sf /usr/bin/gambitc "$pkgdir/usr/bin/gsc-script"
}
