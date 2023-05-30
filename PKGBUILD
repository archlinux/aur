# Maintainer:
# Contributor: Filip Graliński <filipg@amu.edu.pl>

_gitname="tokenizers"
_pkgname="python-$_gitname"
pkgname="$_pkgname"
pkgver=0.13.3
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
  export RUSTUP_TOOLCHAIN=stable

  _cargo_toml_paths=(
    bindings/python
  )

  for i in ${_cargo_toml_paths[@]} ; do
    cd "$srcdir/$_gitname/$i"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
  done
}

build() {
  cd "$srcdir/$_gitname/bindings/python"
  python -m build --no-isolation --wheel
}

package() {
  cd "$srcdir/$_gitname/bindings/python"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
