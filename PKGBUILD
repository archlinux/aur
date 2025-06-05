# Maintainer: Matt Quintanilla <matt at matt quintanilla . xyz>
pkgbase="ocaml-git"
_pkgbase="ocaml"
pkgname=('ocaml-git' 'ocaml-compiler-libs-git')
pkgver=r32422.ec88aac
pkgrel=2
pkgdesc="A functional language with OO extensions"
arch=('x86_64')
license=('LGPL2.1' 'custom: QPL-1.0')
url="https://caml.inria.fr/"
makedepends=('ncurses' 'git')
optdepends=('ncurses: advanced ncurses features' 'tk: advanced tk features')
source=(git+https://github.com/ocaml/ocaml.git)
sha256sums=('SKIP')
options=('!makeflags' '!emptydirs' 'staticlibs')


pkgver() {
  cd "ocaml"
  #git describe --tags | sed 's/-/+/g'
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}




build() {
  cd "${srcdir}/${_pkgbase}"
  CFLAGS+=' -ffat-lto-objects'
  CXXFLAGS+=' -ffat-lto-objects'
  ./configure --prefix /usr --mandir /usr/share/man -enable-frame-pointers
  make --debug=v world.opt
}

package_ocaml-git() {
  conflicts=("$_pkgbase")
  provides=("$_pkgbase")
  cd "${srcdir}/${_pkgbase}"
  make DESTDIR="${pkgdir}" install

  # Save >10MB with this one, makepkg only strips debug symbols.
  #find "${pkgdir}/usr/lib" -type f -name '*.so.*' -exec strip --strip-unneeded {} \;

  # install license
  install -m755 -d "${pkgdir}/usr/share/licenses/${_pkgbase}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgbase}/"

  # remove compiler libs
  rm -rf "${pkgdir}/usr/lib/ocaml/compiler-libs"
}

package_ocaml-compiler-libs-git() {
pkgdesc="Several modules used internally by the OCaml compiler"
license=('custom: QPL-1.0')
depends=('ocaml-git')
provides=("ocaml-compiler-libs")
conflicts=("ocaml-compiler-libs")
optdepends=()

  cd "${srcdir}/${_pkgbase}"
  make DESTDIR="${pkgdir}" install
  # Remove non-compiler-libs
  find "${pkgdir}/usr/lib/ocaml/" -mindepth 1 -maxdepth 1 -not -name "compiler-libs" -execdir rm -rf "{}" "+"
  rm -rf   "${pkgdir}/usr/bin" "${pkgdir}/usr/share"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}

