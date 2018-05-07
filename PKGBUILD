# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=artanis
pkgver=0.2.5
pkgrel=2
pkgdesc="A fast monolithic web-framework of Scheme"
url="http://web-artanis.com/"
depends=('guile')
arch=('x86_64')
license=('GPL')
source=("http://ftp.gnu.org/gnu/$pkgname/$pkgname-${pkgver}.tar.bz2"{,.sig} Makefile.in.patch)
sha256sums=('10cb24a4cefe3e2741521a3ba9efaa4befb8097f6ae1e9b4ab3e21c0f77dabdf'
            'SKIP'
            '854bcd15ad995973c26fe28aa39573704ac31c334881603585be23cabd59c948')
validpgpkeys=('F53B4C5695B5E4D56093432484696772846A0058') # Nala Ginrut
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
