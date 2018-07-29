# Maintainer: crave <crave@infinity>

pkgname=fstar-ulib
pkgver=0.9.6.0
pkgrel=15
pkgdesc="compiles the ulib component of F*"
arch=('i686' 'x86_64')
url='https://www.fstar-lang.org/'
license=('Apache-2.0')
options=('!strip' '!makeflags' 'staticlibs')
depends=('fstar' 'z3' 'ocaml-fstar')

build() {
  cd "$srcdir/"
  rm -rf fstar
  pacman -Ql fstar | cut -f 2 -d ' ' | while read f; do
    if [ -f "$f" ]; then
      mkdir -p "$(dirname ".$f")"
      cp "$f" ".$f"
    fi
  done
  export FSTAR_HOME="$(pwd)/opt/fstar"
  export PATH="$PATH:$FSTAR_HOME/bin"
  cd opt/fstar/ulib/ml
  make -j4
}

package() {
  cd "$srcdir/"
  mkdir -p "$pkgdir/opt/fstar/ulib"
  find opt/fstar/ -type f | while read f; do
    mkdir -p "$(dirname "$pkgdir/$f")"
    pacman -Ql fstar | cut -f 2 -d ' ' | grep -qF "/$f" || cp "$f" "$pkgdir/opt/$f"
  done
}
