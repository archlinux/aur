# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Jürgen Hötzel <juergen@archlinux.org>

pkgbase=ocaml4
pkgname=(ocaml4 ocaml4-compiler-libs)
pkgver=4.14.2
pkgrel=2
pkgdesc="A functional language with OO extensions"
arch=(x86_64)
license=(LGPL2.1 'custom: QPL-1.0')
url="https://ocaml.org/"
makedepends=(ncurses)
optdepends=('ncurses: advanced ncurses features'
            'tk: advanced tk features')
source=(https://caml.inria.fr/distrib/ocaml-${pkgver%.*}/ocaml-${pkgver}.tar.xz)
sha512sums=('acd0c0434d3e98fd97c22b77cabdb02f46e5b68504b751e0fce4886b35b751c1ac89030d380c2b94b096b73ea96b419168c4ecd1b4c8651535cae93de0e81e58')
options=('!makeflags' '!emptydirs' 'staticlibs')

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
