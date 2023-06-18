# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Jürgen Hötzel <juergen@archlinux.org>

pkgbase=ocaml4
pkgname=(ocaml4 ocaml4-compiler-libs)
pkgver=4.14.1
pkgrel=1
pkgdesc="A functional language with OO extensions"
arch=(x86_64)
license=(LGPL2.1 custom: QPL-1.0)
url="https://caml.inria.fr/"
makedepends=(ncurses)
optdepends=('ncurses: advanced ncurses features'
            'tk: advanced tk features')
options=('!makeflags' '!emptydirs' 'staticlibs')
source=(https://caml.inria.fr/distrib/ocaml-${pkgver%.*}/ocaml-${pkgver}.tar.xz)
sha512sums=('326a063e7e18ec55a21fbb129e4b2915733e67166ec1d94412875853aa10fbfb27fdfc9f6440ce65b188924b93f3cb8d01b0c4640179a5a12bc4e561f48b3e5b')

build() {
  cd "${srcdir}/ocaml-${pkgver}"
  CFLAGS+=' -ffat-lto-objects'
  CXXFLAGS+=' -ffat-lto-objects'
  ./configure --prefix /usr --mandir /usr/share/man --disable-force-safe-string --enable-frame-pointers
  make --debug=v world.opt
}

package_ocaml4() {
  conflicts=(ocaml ocaml-compiler-libs)
  cd "${srcdir}/ocaml-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Save >10MB with this one, makepkg only strips debug symbols.
  #find "${pkgdir}/usr/lib" -type f -name '*.so.*' -exec strip --strip-unneeded {} \;

  # install license
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"

  # remove compiler libs
  rm -rf "${pkgdir}/usr/lib/ocaml/compiler-libs"
}

package_ocaml4-compiler-libs() {
pkgdesc="Several modules used internally by the OCaml compiler"
 license=('custom: QPL-1.0')
 depends=(ocaml4)
 conflicts=(ocaml-compiler-libs)

  cd "${srcdir}/ocaml-${pkgver}"
  make DESTDIR="${pkgdir}" install
  # Remove non-compiler-libs
  rm -rf   "${pkgdir}/usr/bin"  "${pkgdir}/usr/lib/ocaml/caml" \
     "${pkgdir}/usr/lib/ocaml/ocamldoc" "${pkgdir}/usr/lib/ocaml/stublibs" \
     "${pkgdir}/usr/lib/ocaml/threads" "${pkgdir}/usr/share"
  find "${pkgdir}/usr/lib/ocaml/" -maxdepth 1 -type f -delete

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
