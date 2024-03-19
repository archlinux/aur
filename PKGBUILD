# Maintainer: Your Name <benjamin.voisin@ens-rennes.fr>
pkgname=belenios
pkgver=2.5
pkgrel=2
pkgdesc="State-of-the-art secure, private and verifiable voting system"
arch=('x86_64')
url="https://www.belenios.org/releases/belenios-$pkgver.tar.gz"
license=('GPL')
groups=()
depends=('ocaml' 'opam' 'npm' 'nodejs')
makedepends=('dune' 'git' 'gmp' 'libsodium' 'pkg-config' 'm4' 'sqlite3' 'openssl' 'curl' 'zip' 'unzip' 'ncurses' 'gd' 'cracklib' 'jq' 'sed')
validpgpkeys=('58EB0999C64E897EE894B8037853DA4D49881AD3')
source=(
  "git+${pkgname}-$pkgver.tar.gz::https://www.belenios.org/releases/belenios-$pkgver.tar.gz"
  "git+${pkgname}-$pkgver.tar.gz.sig::https://www.belenios.org/releases/belenios-$pkgver.tar.gz.sig"
)
sha256sums=('SKIP' 'SKIP')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  opam init -n > /dev/null
  if (( $(opam switch list | grep "$pkgname" -c) == "0" )); then
    echo "Creating the $pkgname switch"
    opam switch create $pkgname --empty > /dev/null
  fi
  eval $(opam env --switch=$pkgname --set-switch)
  opam switch set-invariant ocaml-base-compiler=4.14.1 > /dev/null
  opam install --yes base64 hex dune atdgen zarith cryptokit calendar cmdliner sqlite3 csv ocsipersist-sqlite eliom gettext-camomile ocamlnet
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
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
  make check
}
