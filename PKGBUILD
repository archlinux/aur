# Maintainer: crave <crave@infinity>

pkgname=karamel-git
pkgver=fstar.v2022.11.19.r846.g71facac.karamel.v1.0.0.r421.gbd359d8
pkgrel=1
pkgdesc="a tool for extracting low-level F* programs to readable C code"
arch=('i686' 'x86_64')
url='https://github.com/FStarLang/karamel'
license=('Apache-2.0')
options=('!strip' '!makeflags' 'staticlibs')
depends=('python2' 'opam' 'which')
conflicts=('fstar')
source=('git+https://github.com/FStarLang/FStar.git'
        'git+https://github.com/FStarLang/karamel.git')
sha256sums=('SKIP' 'SKIP')

pkgver() {
  (cd FStar
  echo -n 'fstar.'
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | tr -d '\n')
  (cd karamel
  echo -n '.karamel.'
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
}

OPAM_VER=4.11.0
build() {
  cd "$srcdir"
  export FSTAR_HOME="$(realpath FStar)"
  export PATH="$FSTAR_HOME/bin:$PATH"

  if ! [ -d ~/.opam ]; then
    # I know you probably shouldn't do this in a PKGBUILD
    # But I don't care about ocaml, I just want to use this software
    opam init --shell-setup
    opam switch create "$OPAM_VER"
    opam switch "$OPAM_VER"
  fi

  (eval $(opam env)
  CHECK_IF_PREINSTALLED=false opam install --yes --no-depexts conf-python-2-7 ppx_deriving_yojson zarith pprint "menhir>=20161115" sedlex process fix "wasm>=2.0.0" visitors ctypes-foreign ctypes 
  (cd FStar
  opam install --yes --deps-only .
  make -j$(nproc))
  (cd karamel
  make -j$(nproc))) || echo "If the build failed because of some ocaml messages try deleting ~/.opam, and re-run"
}

package() {
  eval $(opam env)
  cd "$srcdir"
  export PREFIX="$pkgdir/opt/fstar"
  mkdir -p "$PREFIX"
  #(cd FStar; make -j$(nproc) install; cd ulib; export INSTALL_EXEC="$(which install)"; ./install-ulib.sh)
  cp -r FStar/* $PREFIX
  export FSTAR_HOME="$PREFIX"

  export PREFIX="$pkgdir/opt/karamel"
  #(cd karamel; make -j$(nproc) install)
  mkdir -p "$PREFIX"
  cp -r karamel/* $PREFIX
}
