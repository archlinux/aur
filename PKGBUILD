# Maintainer Severin Glöckner <severin.gloeckner@stud.htwk-leipzig.de>

# Quoting the release notes of ocaml 4.0.9
# »The graphics library was moved out of the compiler distribution.«
# This package contains it.

# v5.1.0 requires dune 2.0 to be in the Arch repository
pkgname=ocaml-graphics
pkgver=5.0.0
pkgrel=2
pkgdesc="Graphics library from OCaml"
arch=('x86_64')
url="https://github.com/ocaml/graphics"
license=('LGPL2.1')
depends=('ocaml>=4.0.9')
makedepends=('dune')
source=("https://github.com/ocaml/graphics/archive/${pkgver}.tar.gz")
sha256sums=('07f5861381f85c2f2c0611a86f483807ce43195959c40963028dafaa3abf33ab')
options=(!strip)

build() {
  cd "${srcdir}/graphics-${pkgver}"

  dune build -p graphics
}


package() {
  cd "${srcdir}/graphics-${pkgver}"
  DESTDIR="${pkgdir}" dune install --prefix "/usr" --libdir "lib/ocaml"

  install -dm755 "${pkgdir}/usr/share/"

  # there's nothing useful inside
  rm -r "${pkgdir}/usr/doc/"

  install -Dm644 "$srcdir"/graphics-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  # unfortunately, the files won't be found in the subfolder. Linking them
  cd "${pkgdir}/usr/lib/ocaml/"

  for file in graphics/*graphics*
  do
    ln -s graphics/$(basename "$file") $(basename "$file")
  done
}
 
