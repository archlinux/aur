# Maintainer: korimitsu <korimitsu_aur.wackiness926@passinbox.com>
# Based on PKGBUILD by:
# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Jürgen Hötzel

pkgname=ocaml4-camlp-streams-noframepointers
pkgver=5.0.1
pkgrel=6
# Not enabling '--enable-frame-pointers' in the ocaml4 configure is required for aarch64 compilation, not for x86_64. This is why all the '-noframepointers' packages exist.
pkgdesc="The Stream and Genlex libraries for use with Camlp4 and Camlp5. Patched for x86_64/aarch64 and no ocaml4 frame-pointers."
arch=(x86_64 aarch64)
url="https://github.com/ocaml/camlp-streams"
license=(BSD)
# dune should work
#makedepends=(dune-noframepointers)
makedepends=(dune)
depends=(ocaml4-noframepointers ocaml4-compiler-libs-noframepointers)
provides=("ocaml4-camlp-streams=${pkgver}")
conflicts=(ocaml4-camlp-streams ocaml-camlp-streams)
options=(!strip)
source=("camlp-streams-${pkgver}.tar.gz::https://github.com/ocaml/camlp-streams/archive/v${pkgver}.tar.gz")
sha256sums=('ad71f62406e9bb4e7fb5d4593ede2af6c68f8b0d96f25574446e142c3eb0d9a4')

build() {
  cd "${srcdir}/camlp-streams-${pkgver}"
  dune build
}

package() {
  cd "${srcdir}/camlp-streams-${pkgver}"
  DESTDIR="${pkgdir}" dune install --prefix "/usr" --libdir="$(ocamlc -where)"

  install -dm755 "${pkgdir}/usr/share/"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
