# Maintainer: Benjamin Voisin <benjamin.voisin@ens-rennes.fr>
pkgname=squirrel-prover-git
pkgver=git
pkgrel=1
pkgdesc="a proof assistant dedicated to cryptographic protocols"
arch=('x86_64')
url="https://github.com/squirrel-prover/squirrel-prover.git"
license=('MIT')
groups=()
depends=('ocaml')
makedepends=('dune' 'git' 'python3' 'opam')
source=(${pkgname}::git+https://github.com/squirrel-prover/squirrel-prover.git)
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  opam init -n --bare > /dev/null
  mkdir -p ./switch
  opam switch create ./switch/ --empty > /dev/null
  eval $(opam env --switch=./switch --set-switch)
  opam install . -y --deps-only
}

build() {
  cd "$pkgname"
  make squirrel
}

package() {
  cd "$pkgname"
  mkdir -p $pkgdir/usr/bin
  cp ./squirrel $pkgdir/usr/bin
  cp -r ./theories/ $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/squirrel-prover
  cp -r ./examples $pkgdir/usr/share/squirrel-prover
  cp -r ./utils $pkgdir/usr/share/squirrel-prover
}

check() {
  cd "$pkgname"
  make alcotest
}
