# Maintainer: korimitsu <korimitsu_aur.wackiness926@passinbox.com>
# Based on PKGBUILD by:
# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Jürgen Hötzel <juergen@archlinux.org>

pkgbase=ocaml4-noframepointers
pkgname=(ocaml4-noframepointers ocaml4-compiler-libs-noframepointers)
pkgver=4.14.2
pkgrel=4
# Not enabling '--enable-frame-pointers' in the ocaml4 configure is required for aarch64 compilation, not for x86_64. This is why all the '-noframepointers' packages exist.
pkgdesc="A functional language with OO extensions. Patched for x86_64/aarch64 and no ocaml4 frame-pointers."
arch=(x86_64 aarch64)
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

  # Only enable frame pointers where OCaml 4.x supports it well
  _fp_flag=
  case "$CARCH" in
    x86_64) _fp_flag=--enable-frame-pointers ;;
  esac

  ./configure --prefix /usr --mandir /usr/share/man --disable-force-safe-string ${_fp_flag}
  make --debug=v world.opt
}

package_ocaml4-noframepointers() {
  provides=("ocaml4=${pkgver}")
  conflicts=("ocaml" "ocaml-compiler-libs" "ocaml4")

  cd "${srcdir}/ocaml-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # install license
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"

  # remove compiler libs (go into split package)
  rm -rf "${pkgdir}/usr/lib/ocaml/compiler-libs"
}

package_ocaml4-compiler-libs-noframepointers() {
  pkgdesc="Several modules used internally by the OCaml 4 compiler"
  license=('custom: QPL-1.0')
  depends=(ocaml4-noframepointers)
  provides=("ocaml4-compiler-libs=${pkgver}")
  conflicts=("ocaml-compiler-libs" "ocaml4-compiler-libs")

  cd "${srcdir}/ocaml-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Remove non-compiler-libs
  rm -rf "${pkgdir}/usr/bin"  "${pkgdir}/usr/lib/ocaml/caml" \
         "${pkgdir}/usr/lib/ocaml/ocamldoc" "${pkgdir}/usr/lib/ocaml/stublibs" \
         "${pkgdir}/usr/lib/ocaml/threads" "${pkgdir}/usr/share"
  find "${pkgdir}/usr/lib/ocaml/" -maxdepth 1 -type f -delete

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
