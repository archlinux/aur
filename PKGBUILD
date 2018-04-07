# Maintainer: Marek Kubica <marek@xivilization.net>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Contributor: Sylvester Johansson <scj(at)archlinux(dot)us>
pkgname=ocaml-zip
pkgver=1.06
pkgrel=1
pkgdesc="ZIP and gzip library for OCaml"
arch=('i686' 'x86_64')
url="http://cristal.inria.fr/~xleroy/software.html#camlzip"
license=('GPL')
depends=('ocaml' 'zlib')
makedepends=('ocaml-findlib')
options=(!strip staticlibs)
source=(http://forge.ocamlcore.org/frs/download.php/1616/camlzip-$pkgver.tar.gz)
sha512sums=('5ef0172927106589620678897f12f054533503a5cf13df71bf4deda43f223d0cd6acce118977e87bce53afe289f367b851f192a8e693274c2bd13549121019dd')

build() {
  cd "$srcdir/camlzip-$pkgver"

  make all allopt
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
