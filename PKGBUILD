# Contributor: Leif Warner <abimelech@gmail.com>
pkgname=pijul-darcs
pkgrel=1
pkgver=20151021
pkgdesc="A version control system based on a theory of patches"
url="https://pijul.org/"
license=('GPL')
arch=('i686' 'x86_64')
conflicts=('pijul')
provides=('pijul')
depends=('zlib' 'lmdb')
makedepends=('darcs' 'ocaml-cryptokit' 'ocaml-yojson')
_darcstrunk="http://pijul.org/"

#pkgver() {
#  cd "$srcdir/pijul.org"
#  printf "$s" "$(darcs changes --last 1 | head -n 1 | cut -d ' ' -f 2 | head -c 8)"
#}

prepare() {
  cd "$srcdir"
  msg "Checking for previous build...."

  if [[ -d pijul.org/_darcs ]]; then
    msg "Retrieving missing patches"
    cd pijul.org
    darcs pull --set-default -a "$_darcstrunk"
  else
    msg "Retrieving complete sources"
    darcs get --lazy --set-scripts-executable "$_darcstrunk"
    cd pijul.org
  fi

  rm -rf "$srcdir/pijul.org-build"
  cp -r "$srcdir/pijul.org" "$srcdir/pijul.org-build"
}

  
build() {
  cd "$srcdir/pijul.org-build"
  msg "Starting build..."

  make C_INCLUDE_PATH=/usr/lib/ocaml/
}

package() {
  cd "$srcdir/pijul.org-build"
  mkdir -p "$pkgdir/usr/bin" # Add a -D to the install command upstream.
  make DESTDIR="$pkgdir/usr" install
}
