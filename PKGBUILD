# Maintainer: crave <crave@infinity>

pkgname=fstar-ulib
pkgver=0.9.6.0
pkgrel=11
pkgdesc="compiles the ulib component of F*"
arch=('i686' 'x86_64')
url='https://www.fstar-lang.org/'
license=('Apache-2.0')
options=('!strip' '!makeflags' 'staticlibs')
depends=('fstar' 'z3' 'ocaml-fstar')

build() {
  cd "$srcdir/"
  rm -rf fstar
  cp -r /opt/fstar/ .
  export FSTAR_HOME="$(pwd)/fstar"
  cd fstar
  find -name '*.cmx' -delete
  cd ulib/ml
  make -j4
}

package() {
  cd "$srcdir/"
  mkdir -p "$pkgdir/opt/fstar/ulib"
  find fstar/ulib -type f | while read f; do
    mkdir -p "$(dirname "$pkgdir/opt/$f")"
    pacman -Ql fstar | cut -f 2 -d ' ' | grep -qF "/opt/$f" || cp "$f" "$pkgdir/opt/$f"
  done
}
