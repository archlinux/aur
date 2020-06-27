# Maintainer Severin Glöckner <severin.gloeckner@stud.htwk-leipzig.de>

# Quoting the release notes of ocaml 4.0.9
# »The graphics library was moved out of the compiler distribution.«
# This package contains it.

pkgname=ocaml-graphics
pkgver=5.1.0
pkgrel=1
pkgdesc="Graphics library from OCaml"
arch=('x86_64')
url="https://github.com/ocaml/graphics"
license=('LGPL2.1')
depends=('ocaml>=4.0.9')
makedepends=('dune')
source=("https://github.com/ocaml/graphics/archive/${pkgver}.tar.gz")
sha256sums=('132e0597f42b11ef5d9b0a523fee2edab7c55efd9c3f198d5574349b4595fafb')

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
 
