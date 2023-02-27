# Maintainer: Toolybird <toolybird at tuta dot io>

pkgname=ocaml-augeas
pkgver=0.6
pkgrel=1
pkgdesc="OCaml bindings for Augeas"
arch=(x86_64)
url="https://people.redhat.com/~rjones/augeas/"
license=(LGPL2.1)
depends=(augeas)
makedepends=(ocaml ocaml-findlib)
source=(
  https://people.redhat.com/~rjones/augeas/files/"$pkgname-$pkgver".tar.gz{,.sig}
  https://src.fedoraproject.org/rpms/"$pkgname"/raw/rawhide/f/0001-Use-ocamlopt-g-option.patch
  https://src.fedoraproject.org/rpms/"$pkgname"/raw/rawhide/f/0002-caml_named_value-returns-const-value-pointer-in-OCam.patch
)
validpgpkeys=(F7774FB1AD074A7E8C8767EA91738F73E1B768A0) # Richard W.M. Jones <rjones@redhat.com>
sha256sums=('8aba99ddacd08768ebeef4a2138361d13b41a30317fce7503140cd86a1307611'
            'SKIP'
            '411ca1933065526b2172727c8d7691fca43bc9a583d5af4e0a1fc61aa7480db0'
            '0b0ec2bd8c71e1490993e7868fac5943a758b4120aa4ffe236978787fee0c938')

prepare() {
  cd $pkgname-$pkgver

  # Patches from Fedora
  patch -Np1 -i ../0001-Use-ocamlopt-g-option.patch
  patch -Np1 -i ../0002-caml_named_value-returns-const-value-pointer-in-OCam.patch
}

build() {
  cd $pkgname-$pkgver

  CFLAGS+=" -ffat-lto-objects" \
    ./configure
  make -j1
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  cd $pkgname-$pkgver
  mkdir -p "$pkgdir"/usr/lib/ocaml/stublibs

  OCAMLFIND_DESTDIR="$pkgdir"/usr/lib/ocaml \
    ocamlfind install augeas META ./*.mli ./*.cmx ./*.cma ./*.cmxa ./*.a augeas.cmi ./*.so
}
