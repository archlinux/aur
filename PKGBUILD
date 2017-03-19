# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com
# Contributor: serp <serp256 at gmail dot com>

_pkgname=lwt
pkgname=ocaml-${_pkgname}
pkgver=2.7.0
pkgrel=1
pkgdesc="A library for cooperative threads in OCaml"
arch=('i686' 'x86_64')
url="http://ocsigen.org/${_pkgname}/"
license=('custom:LGPL with OpenSSL linking exception')
depends=('ocaml' 'camlp4' 'ocaml-ppx_tools' 'ocaml-react' 'ocaml-result' 'ocaml-ssl' 'libev' 'glib2')
makedepends=('ocamlbuild' 'ocaml-findlib')
source=("https://github.com/ocsigen/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('00419834e0c5601b3fee6ca9efb0e10ab797a9ff8f695bf2434d89395b7252ec')
options=('!strip' '!makeflags' 'staticlibs')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  echo '<src/top/*.*>: use_compiler_libs' >> _tags
  # What requires what?
  # --enable-glib      glib2
  # --enable-react     ocaml-react
  # --enable-ssl       ocaml-ssl
  ocaml setup.ml -configure --enable-react \
                            --enable-glib \
                            --enable-ssl \
                            --enable-camlp4 \
                            --enable-ppx \
                            --disable-debug \
                            --prefix "${pkgdir}/usr"
  make
}


package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  install -dm755 "${OCAMLFIND_DESTDIR}/stublibs"
  make install
  install -Dm 644 "doc/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
