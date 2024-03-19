# Maintainer: Benjamin Voisin <benjamin.voisin@ens-rennes.fr>
pkgname=squirrel-prover-git
pkgver=latest
pkgrel=3
pkgdesc="a proof assistant dedicated to cryptographic protocols"
arch=('x86_64')
url="https://github.com/squirrel-prover/squirrel-prover.git"
license=('MIT')
groups=()
depends=('ocaml' 'grep')
makedepends=('dune' 'git' 'python3' 'opam')
source=(${pkgname}::git+https://github.com/squirrel-prover/squirrel-prover.git)
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  opam init -n --bare > /dev/null
  if (( $(opam switch list | grep "$pkgname" -c) == "0" )); then
    echo "Creating the $pkgname switch..."
    opam switch create $pkgname --empty > /dev/null
  fi
  opam switch $pkgname > /dev/null
  eval $(opam env --switch=$pkgname --set-switch)
  opam install . -y --deps-only --switch=$pkgname
}

build() {
  cd "$pkgname"
  eval $(opam env --switch=$pkgname --set-switch)
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
  eval $(opam env --switch=$pkgname --set-switch)
  make alcotest
}
