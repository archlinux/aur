# Maintainer: Arielfoever <ArielHeleneto@outlook.com>

pkgname=sail-model
pkgver=0.19.1
pkgrel=1
pkgdesc="The Sail ISA specification language"
arch=('x86_64')
url="https://github.com/rems-project/sail"
license=('BSD-2-Claus')
depends=(
  'z3'
)
makedepends=(
  'opam'
  'dune'
  'ocaml>=4.8.1'
  'z3'
  'bash'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/rems-project/sail/archive/refs/tags/${pkgver}.tar.gz"
)
sha512sums=('77497EC093BFFB5F4F0967430295FE69C33E3DCB8A158C3CA287D6311EC7F57A1CDCDB4211591B7C8F3783267238E60E786F4D36BD525805D44F38C19660BBEC')
provides=('sail')

build() {
  opam init --yes --no-setup --shell=sh --compiler=5.2.1 --interactive

  cd "sail-$pkgver"

  eval $(opam env)
  # opam install . --deps-only --yes
  # dune build --release

  opam pin --yes --no-action add .
  opam install sail --yes
}

check() {
  cd "sail-$pkgver"
  # export SAIL_DIR=$(pwd)
  PATH=$(pwd):$PATH test/run_core_tests.sh
}

package() {
  cd "sail-$pkgver"
  eval $(opam env)
  dune install --relocatable --prefix="." --destdir="${pkgdir}/usr"
  # dune install --relocatable 

  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
