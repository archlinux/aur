# Maintainer Severin Glöckner <severin.gloeckner@stud.htwk-leipzig.de>

# Quoting the release notes of ocaml 4.0.9
# »The graphics library was moved out of the compiler distribution.«
# This package contains it.

pkgname=ocaml-graphics
pkgver=5.1.1
pkgrel=1
pkgdesc="Graphics library from OCaml"
arch=('x86_64')
url="https://github.com/ocaml/graphics"
license=('LGPL2.1')
depends=('ocaml>=4.0.9')
makedepends=('dune')
source=("https://github.com/ocaml/graphics/archive/${pkgver}.tar.gz")
sha256sums=('dbef15667cdab65672c60739d5e51ff4341b9595fbc6e39003368637b5915240')

build() {
  cd "${srcdir}/graphics-${pkgver}"

  dune build -p graphics
}


package() {
  cd "${srcdir}/graphics-${pkgver}"

  DESTDIR="${pkgdir}" dune install --prefix "/usr" --libdir "lib/ocaml"

  # there's nothing useful inside
  rm -r "${pkgdir}/usr/doc/"

  # license has an addition to LGPL2.1
  install -Dm644 "$srcdir"/graphics-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  # unfortunately, the files won't be found in the subfolder. Linking them
  cd "${pkgdir}/usr/lib/ocaml/"
  for file in graphics/*graphics*
  do
    ln -s graphics/$(basename "$file") $(basename "$file")
  done
}
 
