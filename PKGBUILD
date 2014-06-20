# Maintainer: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Contributor: Sylvester Johansson <scj(at)archlinux(dot)us>
pkgname=ocaml-zip
pkgver=1.05
pkgrel=1
pkgdesc="zip and gzip library for ocaml"
arch=('i686' 'x86_64')
url="http://cristal.inria.fr/~xleroy/software.html#camlzip"
license=('GPL')
depends=('ocaml' 'zlib')
makedepends=('ocaml-findlib')
options=(!strip)
source=(http://forge.ocamlcore.org/frs/download.php/1037/camlzip-$pkgver.tar.gz)
md5sums=('e85c179d5dc79821e6e8d90e636599f1')

build() {
  cd "$srcdir/camlzip-$pkgver"

  make all allopt || return 1
  mkdir -p html
  ocamldoc -html -d html gzip.mli zip.mli
}

package() {
  cd "$srcdir/camlzip-$pkgver"

  export OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
  export OCAMLFIND_LDCONF="ignore"

  mkdir -p "$OCAMLFIND_DESTDIR/stublibs"
  ocamlfind install camlzip META *.mli *.cmi *.cma *.cmxa *.a *.so
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -d -m 0755 "${pkgdir}/usr/share/doc/$pkgname"
  install -t "${pkgdir}/usr/share/doc/$pkgname/" html/*
}
