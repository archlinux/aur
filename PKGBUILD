# Contributor: Louis-Guillaume Gagnon <louis.guillaume.gagnon@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gambit-c-git
pkgver=4.9.5.r5.gf1fbe9aa
pkgrel=1
pkgdesc="Scheme R5RS interpreter and compiler (via C) - git version"
arch=('i686' 'x86_64')
url="http://gambitscheme.org"
license=('Apache' 'LGPL2.1')
depends=('bash')
makedepends=('git')
checkdepends=('git')
provides=('gambit-c')
conflicts=('gambit-c')
options=('staticlibs' '!lto' '!buildflags' '!makeflags')
source=(gambit-scheme::git+https://github.com/gambit/gambit.git math.h.patch)
md5sums=('SKIP'
         '59f7a342d87e0970a6b3a222d4c954cb')

pkgver() {
  cd gambit-scheme
  git describe --tags|sed 's+-+.r+'| sed 's+-+.+' | cut -c2-
}

prepare() {
  cd gambit-scheme
  patch -Np1 < "$srcdir"/math.h.patch
}

build() {
  cd gambit-scheme
  export CFLAGS=`echo " $CFLAGS " | sed -e "s/-O1 / /g" -e "s/ -O2 / /g" -e "s/ -O3 / /g"`
  export CXXFLAGS=`echo " $CXXFLAGS " | sed -e "s/-O1 / /g" -e "s/ -O2 / /g" -e "s/ -O3 / /g"`

  ./configure --prefix=/usr \
      --docdir=/usr/share/gambit-c \
      --infodir=/usr/share/info \
      --libdir=/usr/lib/gambit-c \
      --disable-shared \
      --enable-compiler-name=gambitc \
      --enable-interpreter-name=gambiti \
      --enable-single-host
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
