# Maintainer: Nick Østergaard <oe.nick at gmail dot com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: Jason Taylor <jftaylor21@gmail.com>
# Contributor: Luis Henrique <lmello.009@gmail.com>

pkgname=ngspice-git
pkgver=r7276.598751eb8
pkgrel=1
pkgdesc='Mixed-level/Mixed-signal circuit simulator based on Spice3f5, Ciber1b1, and Xspice.'
url='http://ngspice.sourceforge.net'
license=('BSD')
arch=('i686' 'x86_64')
depends=('libxaw' 'fftw' 'libxft')
source=("${pkgname}"::"git+https://git.code.sf.net/p/ngspice/ngspice#branch=master"
        "manual.pdf"::"http://ngspice.sourceforge.net/docs/ngspice-manual.pdf")
conflicts=("ngspice")
provides=("ngspice")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
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
  mkdir -p $pkgdir/usr/share/doc/$pkgname
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644  "$srcdir/manual.pdf" "$pkgdir/usr/share/doc/$pkgname/manual.pdf"

  install -D -m644 ngspice.pc "$pkgdir/usr/lib/pkgconfig/ngspice.pc"
  install -Dm755 src/.libs/libngspice.so.0.0.0 "$pkgdir/usr/lib/libngspice.so.0.0.0"
  ln -s "libngspice.so.0.0.0" "$pkgdir/usr/lib/libngspice.so.0"
  ln -s "libngspice.so.0.0.0" "$pkgdir/usr/lib/libngspice.so"
}
