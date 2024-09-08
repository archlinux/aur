# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=ocaml4-lablgtk2
pkgver=2.18.12
pkgrel=3
pkgdesc="An Objective Caml interface to gtk2"
arch=(x86_64)
license=(LGPL2.1)
url="https://garrigue.github.io/lablgtk/"
depends=(gtk2 librsvg)
makedepends=(ocaml4 ocaml4-compiler-libs ocaml4-camlp4 ocaml4-camlp-streams ocaml4-findlib)
optdepends=('ocaml4: for using the tools')
conflicts=(lablgtk2)
options=(!makeflags staticlibs !lto)
source=("lablgtk2-${pkgver}.tar.gz::https://github.com/garrigue/lablgtk/archive/${pkgver}.tar.gz")
sha512sums=('284a1234ae817c4df49809d28c103ca5e64046da5ec9ff28c6edc0ce999e9d3e6e180dd053f8b1663d4fb3b7ba19570d53b9441c8fa622add924e8d85e41b813')

build() {
  cd "${srcdir}/lablgtk-${pkgver}"
  ./configure --prefix=/usr \
    --without-gnomeui \
    --without-gnomecanvas \
    --without-panel \
    --without-gtkspell \
    --without-gtksourceview \
    --without-gtksourceview2 \
    --without-glade
  sed -e "s|-O|$CFLAGS|" \
      -e "s|-shared|& -ccopt \"$LDFLAGS\"|" \
      -e "s|(CAMLMKLIB)|& -ldopt \"$LDFLAGS\"|" \
      -i src/Makefile
  make world
  make opt
}

package() {
  cd "${srcdir}/lablgtk-${pkgver}"
  make DESTDIR="${pkgdir}" old-install
  install -m644 META "${pkgdir}/usr/lib/ocaml/lablgtk2/"
}
