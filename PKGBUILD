# Maintainer:  Score_Under <seejay.11@gmail.com>
# Contributor: Catalin Hritcu <catalin.hritcu@gmail.com>
# Contributor: Marek Kubica <marek@xivilization.net>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Nicolas Pouillard <nicolas(dot)pouillard(at)gmail(dot)com>
# Contributor: Sylvester Johansson <scj(at)archlinux(dot)us>
# Contributor: Sergey Plaksin <serp256(at)gmail(dot)com>
# Contributor: Leander Schröder <rleanderschroeder@gmail.com>

pkgname=ocaml-batteries
pkgver=3.6.1
pkgrel=1
pkgdesc="A comprehensive standard library for OCaml"
arch=('i686' 'x86_64')
url="https://github.com/ocaml-batteries-team/batteries-included"
license=('LGPL')
depends=('ocaml>=4.03' 'ocaml-findlib>=1.5.3' 'ocaml-num>=1.1' 'camlp-streams')
optdepends=('ocaml-bisect')
makedepends=('ocamlbuild')
install=ocaml-batteries.install
source=("https://github.com/ocaml-batteries-team/batteries-included/archive/v${pkgver}.tar.gz")
sha512sums=('16fd3b541f2b9504d26e1387b1d8b7279746221136391857c90193d3cc5b2814535d87ce54abfa2f50856a26f69e1a7a67f9574d208ba2f8a39630de59bf3a64')
options=(!strip !makeflags)

build(){
  cd "$srcdir/${pkgname/ocaml-/}-included-$pkgver"

  sanitize_all_opam_paths

  OCAMLBUILD="ocamlbuild -no-links" make all doc
}

package(){
  cd "$srcdir/${pkgname/ocaml-/}-included-$pkgver"

  export DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
  export OCAMLFIND_DESTDIR="$DESTDIR"
  mkdir -p $OCAMLFIND_DESTDIR

  sanitize_all_opam_paths

  OCAMLBUILD="ocamlbuild -no-links" make install
  DOCROOT="$pkgdir/usr/share/doc/$pkgname/" make install-doc
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 toplevel/ocamlinit "$pkgdir/usr/share/doc/$pkgname/ocamlinit"
}

sanitize_all_opam_paths() {
  if [ -n "$OPAM_SWITCH_PREFIX" ]; then
    warning 'This package is being built under an OPAM switch. It should be built with a clean environment instead.'
    warning 'An attempt will be made to sanitize OPAM environment variables.'
    PATH=$(sanitize_opam_paths "$PATH")
    CAML_LD_LIBRARY_PATH=$(sanitize_opam_paths "$CAML_LD_LIBRARY_PATH")
    PKG_CONFIG_PATH=$(sanitize_opam_paths "$PKG_CONFIG_PATH")
    unset OPAM_SWITCH_PREFIX
  fi
}

sanitize_opam_paths() (
  IFS=:
  set -f
  colon=
  for path in $1; do
    case $path in
      "$OPAM_SWITCH_PREFIX"|"$OPAM_SWITCH_PREFIX"/*) ;;
      *)
        printf "%s%s" "$colon" "$path"
        colon=:
        ;;
    esac
  done
)
