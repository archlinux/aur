# Maintainer: Your Name <benjamin.voisin@ens-rennes.fr>
pkgname=belenios
pkgver=2.5.1
pkgrel=1
pkgdesc="State-of-the-art secure, private and verifiable voting system"
arch=('x86_64')
url="https://gitlab.inria.fr/belenios/belenios.git"
license=('GPL')
groups=()
depends=('ocaml' 'opam' 'npm' 'nodejs')
makedepends=('dune' 'git' 'gmp' 'libsodium' 'pkg-config' 'm4' 'sqlite3' 'openssl' 'curl' 'zip' 'unzip' 'ncurses' 'gd' 'cracklib' 'jq' 'sed')
_tag=55f9dc8ea92a8ff60e4e93d3473bfd496e179616 #git rev-parse $pkgver
source=( "$pkgname-$pkgver::git+https://gitlab.inria.fr/belenios/belenios.git#tag=$_tag")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  opam init -n > /dev/null
  if (( $(opam switch list | grep "$pkgname" -c) == "0" )); then
    echo "Creating the $pkgname switch"
    opam switch create $pkgname --empty > /dev/null
  fi
  opam switch $pkgname
  eval $(opam env --switch=$pkgname --set-switch)
  opam switch set-invariant ocaml-base-compiler=4.14.1 --switch=$pkgname > /dev/null
  opam install --yes --switch=$pkgname base64 hex dune atdgen zarith cryptokit calendar cmdliner sqlite3 csv ocsipersist-sqlite eliom gettext-camomile ocamlnet
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  eval $(opam env --switch=$pkgname --set-switch)
  make
  sed -i "s/nodejs/node/g" frontend/Makefile
  make build-release-server
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  cp -r _run/usr $pkgdir/
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  eval $(opam env --switch=$pkgname --set-switch)
  make check
}
