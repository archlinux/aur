# Maintainer Severin Glöckner <severin.gloeckner@stud.htwk-leipzig.de>

# Quoting the release notes of ocaml 4.0.9
# »The graphics library was moved out of the compiler distribution.«
# This package contains it.

pkgname=ocaml-graphics
pkgver=5.1.2
pkgrel=1
pkgdesc="Graphics library from OCaml"
arch=('x86_64')
url="https://github.com/ocaml/graphics"
license=('LGPL2.1')
depends=('ocaml>=4.0.9')
makedepends=('dune')
source=("https://github.com/ocaml/graphics/archive/${pkgver}.tar.gz")
sha256sums=('9db6e8cd71a77fbec28cdee3fe5ed4640d6b92d9eb5ad68150beccae316620fe')

build() {
  cd "${srcdir}/graphics-${pkgver}"

  dune build -p graphics
}


package() {
  cd "${srcdir}/graphics-${pkgver}"

  DESTDIR="${pkgdir}" dune install --prefix "/usr" --libdir "lib/ocaml"

  # There's nothing useful inside.
  rm -r "${pkgdir}/usr/doc/"

  # License has an addition to LGPL2.1.
  install -Dm644 "$srcdir"/graphics-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  # Unfortunately, the files won't be found in the subfolder. Linking them.
  cd "${pkgdir}/usr/lib/ocaml/"
  for file in graphics/*graphics*
  do
    ln -s graphics/$(basename "$file") $(basename "$file")
  done
}
 
