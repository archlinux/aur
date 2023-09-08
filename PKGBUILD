# Maintainer:
# Contributor: Filip Graliński <filipg@amu.edu.pl>

if [ x"$CARGO_HOME" == "x" ] ; then
  if [ x"$SRCDEST" == "x" ] ; then
    export CARGO_HOME="$startdir/cargo"
  else
    export CARGO_HOME="$SRCDEST/cargo"
  fi
fi

_gitname="tokenizers"
_pkgname="python-$_gitname"
pkgname="$_pkgname"
pkgver=0.14.0
pkgrel=1
pkgdesc='Fast State-of-the-Art Tokenizers optimized for Research and Production'
arch=('i686' 'x86_64')
url="https://github.com/huggingface/tokenizers"
license=('Apache')
depends=(
  'python'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-maturin'
  'python-setuptools-rust'
  'python-wheel'
)
provides=("$_pkgname")
conflicts=(${provides[@]})
source=(
  "$_gitname"::"git+$url#tag=v$pkgver"
)
sha256sums=(
  'SKIP'
)

prepare() {
  _cargo_toml_paths=(
    bindings/python
  )

  for i in ${_cargo_toml_paths[@]} ; do
    cd "$srcdir/$_gitname/$i"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
  done
}

build() {
  cd "$srcdir/$_gitname/bindings/python"
  cargo build --frozen --release
  python -m build --no-isolation --wheel
}

package() {
  cd "$srcdir/$_gitname/bindings/python"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
