# Maintainer: korimitsu <korimitsu_aur.wackiness926@passinbox.com>
# Based on PKGBUILD by:
# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=ocaml4-camlp4-noframepointers
pkgver=4.14+1
pkgrel=2
# Not enabling '--enable-frame-pointers' in the ocaml4 configure is required for aarch64 compilation, not for x86_64. This is why all the '-noframepointers' packages exist.
pkgdesc='Caml preprocessor and pretty-printer. Patched for x86_64/aarch64 and no ocaml4 frame-pointers.'
arch=(x86_64 aarch64)
url='https://github.com/ocaml/camlp4/releases'
license=(GPL2)
depends=(ocaml4-noframepointers)
makedepends=(
  ocaml4-ocamlbuild-noframepointers
  ocaml4-compiler-libs-noframepointers
  ocaml4-findlib-noframepointers
  ocaml4-camlp-streams-noframepointers
)
provides=("ocaml4-camlp4=${pkgver}")
conflicts=(ocaml4-camlp4 ocaml-camlp4)
options=(!makeflags !emptydirs staticlibs)
source=("camlp4-${pkgver}.tar.gz::https://github.com/camlp4/camlp4/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('93d52b5be818c3662f6aa462a33c908a68bc85a19554f2352e2a146edbe0b39f7c9de2807a507c4f83fc59188030d085eca473afd03e71e05b039950683542ef')

build() {
  cd "camlp4-${pkgver//+/-}"
  CFLAGS+=' -ffat-lto-objects -w'
  ./configure
  make all camlp4/META
}

package() {
  cd "camlp4-${pkgver//+/-}"
  make \
    BINDIR="$pkgdir/usr/bin" \
    LIBDIR="$pkgdir/usr/lib/ocaml" \
    PKGDIR="$pkgdir/usr/lib/ocaml" \
    install install-META
}
