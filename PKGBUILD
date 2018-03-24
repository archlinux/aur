# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=artanis
pkgver=0.2.4
pkgrel=1
pkgdesc="A fast monolithic web-framework of Scheme"
url="http://web-artanis.com/"
depends=('guile')
arch=('x86_64')
license=('GPL')
source=("http://ftp.gnu.org/gnu/$pkgname/$pkgname-${pkgver}.tar.bz2" Makefile.in.patch)
md5sums=('4729b7cf8329b63778a6e4288642df02'
         '84cb84c7b8b2f780d6777b8a7d15b6b0')
options=('!strip')

prepare() {
  cd $pkgname-$pkgver 
  patch -Np1 < "$srcdir"/Makefile.in.patch
}

build() {
  cd $pkgname-$pkgver 
  GUILE_EFFECTIVE_VERSION=2.2 ./configure --prefix=/usr
  make
  make docs
}

check() {
  cd $pkgname-$pkgver
  export GUILE_LOAD_PATH=$GUILE_LOAD_PATH:.
  guile -c '(display (@ (artanis artanis) artanis-version))'
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir install
  # repair
  cp -r "$pkgdir"/{share,bin} "$pkgdir"/usr
  rm -r "$pkgdir"/{share,bin}
}
