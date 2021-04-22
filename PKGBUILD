# Contributor: Louis-Guillaume Gagnon <louis.guillaume.gagnon@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gambit-c-git
pkgver=4.9.3.r1378.g1fc722ae
pkgrel=1
pkgdesc="Scheme R5RS interpreter and compiler (via C) - git version"
arch=('i686' 'x86_64')
url="http://gambitscheme.org"
license=('Apache' 'LGPL2.1')
depends=('bash')
makedepends=('git')
provides=('gambit-c')
conflicts=('gambit-c')
options=('staticlibs')
source=(gambit-scheme::git+https://github.com/gambit/gambit.git)
md5sums=('SKIP')

pkgver() {
  cd gambit-scheme
  git describe --tags|sed 's+-+.r+'| sed 's+-+.+' | cut -c2-
}

build() {
  cd gambit-scheme
  export CFLAGS=`echo " $CFLAGS " | sed -e "s/-O1 / /g" -e "s/ -O2 / /g" -e "s/ -O3 / /g"`
  export CXXFLAGS=`echo " $CXXFLAGS " | sed -e "s/-O1 / /g" -e "s/ -O2 / /g" -e "s/ -O3 / /g"`
  ./configure
  make
  ./configure --prefix=/usr \
      --docdir=/usr/share/gambit-c \
      --infodir=/usr/share/info \
      --libdir=/usr/lib/gambit-c \
      --disable-shared \
      --enable-compiler-name=gambitc \
      --enable-interpreter-name=gambiti \
      --enable-single-host \
      --enable-c-opt
  make
  make doc
}

check() {
  cd gambit-scheme
  make check || true
}

package() {
  cd gambit-scheme
  make DESTDIR="$pkgdir/" install
  ln -sf /usr/bin/gambitc "$pkgdir"/usr/bin/gsc-script
}
