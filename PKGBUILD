# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=tree-sitter
pkgname=$_pkgname-git
pkgver=0.16.5.r2995.c393591e
pkgrel=2
pkgdesc='An incremental parsing system for programming tools'
arch=('x86_64')
url='https://github.com/tree-sitter/tree-sitter'
license=('MIT')
provides=('tree-sitter' 'libtree-sitter.so')
conflicts=('tree-sitter')
makedepends=('git' 'cargo' 'npm' 'emscripten')
source=("git+$url")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname

  printf "%s.r%s.%s" \
        $(git tag | tail -n1) \
        $(git rev-list --count HEAD) \
        $(git rev-parse --short HEAD)
}

build() {
  cd $_pkgname

  make

  # emcc needs to be run at least one time before using to spit out their initial message .-.
  /usr/lib/emscripten/emcc 2>&1 >/dev/null

  ./script/build-wasm

  cd cli

  cargo build --release --locked --all-features
}

package() {
  cd $_pkgname

  make DESTDIR="$pkgdir" PREFIX=/usr install

  install -Dm 755 target/release/$_pkgname -t "$pkgdir"/usr/bin

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

