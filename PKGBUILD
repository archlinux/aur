# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com
# Contributor: serp <serp256 at gmail dot com>

_pkgname=lwt
pkgname=ocaml-${_pkgname}
pkgver=2.4.8
pkgrel=2
pkgdesc="A library for cooperative threads in OCaml"
arch=('i686' 'x86_64')
url="http://ocsigen.org/${_pkgname}/"
license=('LGPL')
depends=('ocaml' 'camlp4'  'ocaml-react' 'ocaml-ssl' 'libev' 'glib2')
makedepends=('ocaml-findlib')
source=(https://github.com/ocsigen/${_pkgname}/archive/$pkgver.tar.gz)
sha256sums=('cada92a1c7ce9c678adc67dfa0a8c51f582358e99bbe839ece2decd6866cfa38')
options=(!strip !makeflags staticlibs)

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  echo '<src/top/*.*>: use_compiler_libs' >> _tags
  # What requires what?
  # --enable-glib      glib2
  # --enable-react     ocaml-react
  # --enable-ssl       ocaml-ssl

  ./configure --enable-react \
              --enable-glib \
              --enable-ssl \
              --enable-camlp4 \
              --disable-debug \
              --prefix /usr \
              --destdir $pkgdir
  make
}


package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  export OCAMLFIND_DESTDIR="${pkgdir}/$(ocamlfind printconf destdir)"
  mkdir -p "$OCAMLFIND_DESTDIR/stublibs"
  
  make install
  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
