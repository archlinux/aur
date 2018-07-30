# Maintainer: crave <crave@infinity>

pkgname=fstar-ulib
pkgver=0.9.6.0
pkgrel=18
pkgdesc="compiles the ulib component of F*"
arch=('i686' 'x86_64')
url='https://www.fstar-lang.org/'
license=('Apache-2.0')
options=('!strip' '!makeflags' 'staticlibs')
depends=('fstar' 'z3' 'ocaml-fstar')

build() {
  cd "$srcdir/"
  rm -rf fstar
  # Copy fstar's files to $srcdir
  pacman -Qlq fstar | while read f; do
    if [ -f "$f" ]; then
      mkdir -p "$(dirname ".$f")"
      cp "$f" ".$f"
    fi
  done
  export FSTAR_HOME="$(pwd)/opt/fstar"
  export PATH="$PATH:$FSTAR_HOME/bin"
  cd opt/fstar/ulib
  # Build ulib
  make -j4
  cd ml
  make -j4
}

package() {
  cd "$srcdir/"
  mkdir -p "$pkgdir/opt/fstar/ulib"
  # Copy files that we created to $pkgdir
  find opt/fstar/ -type f | while read f; do
    mkdir -p "$(dirname "$pkgdir/$f")"
    pacman -Qlq fstar | grep -qF "/$f" || cp "$f" "$pkgdir/$f"
  done
}
