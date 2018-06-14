# Maintainer: Nick Østergaard <oe.nick at gmail dot com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: Jason Taylor <jftaylor21@gmail.com>
# Contributor: Luis Henrique <lmello.009@gmail.com>

pkgname=ngspice-git
pkgver=r4824.99a20162d
pkgrel=1
pkgdesc='Mixed-level/Mixed-signal circuit simulator based on Spice3f5, Ciber1b1, and Xspice.'
url='http://ngspice.sourceforge.net'
license=('BSD')
arch=('i686' 'x86_64')
depends=('libxaw' 'libedit' 'gcc-libs')
source=("${pkgname}"::"git://git.code.sf.net/p/ngspice/ngspice#commit=99a20162d5038a328d335d11da69c9eee0549fdc"
        "manual.pdf"::"http://ngspice.sourceforge.net/docs/ngspice-manual.pdf")
conflicts=("ngspice")
provides=("ngspice")
sha256sums=('SKIP'
            'af11dd48b59a7dc9b5126ce5fec4e71d7dd1f7e93e21f16bb6f6636197c62a56')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mv ./manual.pdf "$srcdir/$pkgname/doc/"
  cd "$srcdir/$pkgname"
  # This is a git repo clone so generate the build config.
  ./autogen.sh
}

build() {
  cd "$srcdir/$pkgname"

  # FS#45230, create so lib
  # shared lib sets flags and modifies headers, needs dedicated pass
  ./configure --prefix=/usr \
              --mandir=/usr/share/man \
              --infodir=/usr/share/info \
              --with-readline=yes \
              --enable-xspice \
              --enable-cider \
              --enable-openmp \
              --with-ngshared
  make
  #strip ./src/.libs/libngspice.so.0.0.0

  ./configure --prefix=/usr \
              --mandir=/usr/share/man \
              --infodir=/usr/share/info \
              --with-readline=yes \
              --enable-xspice \
              --enable-cider \
              --enable-openmp
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644  "$srcdir/$pkgname/doc/manual.pdf" "$pkgdir/usr/share/doc/$pkgname/manual.pdf"

  install -Dm755 src/.libs/libngspice.so.0.0.0 "$pkgdir/usr/lib/libngspice.so.0.0.0"
  ln -s "libngspice.so.0.0.0" "$pkgdir/usr/lib/libngspice.so.0"
  ln -s "libngspice.so.0.0.0" "$pkgdir/usr/lib/libngspice.so"
}
