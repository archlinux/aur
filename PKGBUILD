# Maintainer: M0Rf30
# Contributor: Sigmund Vestergaard <sigmundv at gmail dot com>
# Contributor: Denis Wernert <denis@wernert.info>

pkgname=ocaml-ssl
pkgver=0.5.3
pkgrel=1
pkgdesc="OCaml SSL Library"
arch=('i686' 'x86_64')
url="http://savonet.sourceforge.net/"
license=('custom')
depends=('openssl')
makedepends=('ocaml' 'ocaml-findlib' 'autoconf')
source=(https://github.com/savonet/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz)
options=(!libtool !strip zipman !makeflags staticlibs)

build() {
  cd $pkgname-$pkgver
  autoconf
  ./configure --prefix /usr
  make
}

package() {
  OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  cd $pkgname-$pkgver
  mkdir -p $OCAMLFIND_DESTDIR/stublibs
  OCAMLFIND_INSTFLAGS="-destdir $OCAMLFIND_DESTDIR -ldconf /dev/null" make install

  mkdir -p $pkgdir/usr/share/licenses/$pkgname/
  awk 'BEGIN{P=0} /License/ {P = 1;} {if (P) print}' README.md > $pkgdir/usr/share/licenses/$pkgname/license
}

md5sums=('9fd48066d1cd4db52b40e2f59a7d4d83')
