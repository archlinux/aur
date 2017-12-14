# Contributor: Louis-Guillaume Gagnon <louis.guillaume.gagnon@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gambit-c-git
pkgver=4.8.8.r416.g5f71e002
pkgrel=1
pkgdesc="Scheme R5RS interpreter and compiler (via C) - git version"
arch=('i686' 'x86_64')
url="http://gambitscheme.org"
license=('Apache' 'LGPL2.1')
depends=('bash')
makedepends=('git')
provides=('gambit-c')
conflicts=('gambit-c')
options=('!makeflags' 'staticlibs')
source=(gambit-scheme::git+https://github.com/feeley/gambit.git)
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/gambit-scheme"
    git describe --tags|sed 's+-+.r+'| sed 's+-+.+' | cut -c2-
}

build() {
  cd "$srcdir/gambit-scheme"
  ./configure
  make current-gsc-boot
  
  ./configure \
      --prefix=/usr \
      --docdir=/usr/share/gambit-c \
      --infodir=/usr/share/info \
      --libdir=/usr/lib/gambit-c \
      --enable-c-opt \
      --enable-gcc-opts \
      --disable-shared \
      --enable-compiler-name=gambitc \
      --enable-interpreter-name=gambiti \
      --enable-single-host
  make bootstrap
  make bootclean
  make
  make doc
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
