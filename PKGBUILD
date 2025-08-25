# Maintainer: Christopher Price <pricechrispy at gmail dot com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Jakob Nixdorf <flocke@shadowice.org>
# Contributor: Bertram Felgenhauer <int-e@gmx.de>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
pkgname=camlidl
pkgver=1.13
_pkgver=${pkgver/\./}
pkgrel=1
pkgdesc="A stub code generator and COM binding for Objective Caml (OCaml)"
arch=('x86_64')
url="https://github.com/xavierleroy/camlidl"
license=(LGPL2.1)
depends=('ocaml')
makedepends=()
options=(staticlibs)
source=("https://github.com/xavierleroy/$pkgname/archive/$pkgname$_pkgver.tar.gz"
        META.camlidl
        patch.diff)
sha256sums=('c82bfd106208ebedd8c264300e939010f87eed83e6f6339e3a6cf8f66caeed54'
            'SKIP'
            'SKIP')

build() {
  #ls -alh
  cp patch.diff "$srcdir/$pkgname-$pkgname$_pkgver"

  cd "$srcdir/$pkgname-$pkgname$_pkgver"
  cp config/Makefile.unix config/Makefile

  #ls -alh
  #git apply -v patch.diff
  patch -p1 < patch.diff

  #ls -alh /usr/lib/ocaml/Makefile.config
  #mkdir -p /build/camlidl/pkg/camlidl//usr/lib/ocaml/
  #ln -s /usr/lib/ocaml/Makefile.config /build/camlidl/pkg/camlidl//usr/lib/ocaml/Makefile.config
  #ls -alh /build/camlidl/pkg/camlidl//usr/lib/ocaml/Makefile.config

  make all
}

package() {
  cd "$srcdir/$pkgname-$pkgname$_pkgver"

  local _bindir="$pkgdir/usr/bin"
  local _ocamldir="$pkgdir/$(ocamlc -where)"
  mkdir -p "$_bindir" "$_ocamldir"/{caml,stublibs,"$pkgname"}

  make BINDIR="$_bindir" OCAMLLIB="$_ocamldir" install

  install -Dm644 "$srcdir/META.camlidl" "$_ocamldir/$pkgname/META"
}
