# Maintainer: korimitsu <korimitsu_aur.wackiness926@passinbox.com>
# Based on PKGBUILD by:
# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org> 
# Contributor: Jürgen Hötzel <juergen@hoetzel.info>

pkgname=ocaml4-ocamlbuild-noframepointers
pkgver=0.14.2
pkgrel=5
# Not enabling '--enable-frame-pointers' in the ocaml4 configure is required for aarch64 compilation, not for x86_64. This is why all the '-noframepointers' packages exist.
pkgdesc='Build tool, that has built-in rules for building OCaml library and programs. Patched for x86_64/aarch64 and no ocaml4 frame-pointers.'
arch=(x86_64 aarch64)
url='https://github.com/ocaml/ocamlbuild'
license=('LGPL-2.1-or-later' 'custom: OCaml-LGPL-linking-exception')
depends=(ocaml4-noframepointers)
conflicts=(ocaml-ocamlbuild ocaml4-ocamlbuild)
provides=("ocaml4-ocamlbuild=${pkgver}")
source=("ocamlbuild-$pkgver.tar.gz::https://github.com/ocaml/ocamlbuild/archive/$pkgver.tar.gz")
b2sums=('d81613878f93f27c6de41461e6b3cebe0744a5204297725263a608cb129a708aaf6f27b444b97d68f2bde844a760f8e78647641f10eed61e727ef3936562cdea')
options=(!makeflags)

build() {
  cd "ocamlbuild-$pkgver"
  make configure \
    PREFIX=/usr \
    BINDIR=/usr/bin \
    LIBDIR=/usr/lib/ocaml \
    MANDIR=/usr/share/man
  make
}

package() {
  cd "ocamlbuild-$pkgver"
  make \
    PREFIX="$pkgdir/usr" \
    BINDIR="$pkgdir/usr/bin" \
    LIBDIR="$pkgdir/usr/lib/ocaml" \
    MANDIR="$pkgdir/usr/share/man" \
    CHECK_IF_PREINSTALLED=false \
    install
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
