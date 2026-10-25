# Maintainer: Collen Jones <collenjones@gmail.com>
pkgname=goose-lang
pkgver=2026.3
pkgrel=1
pkgdesc="Memory-safe systems language with no heap allocator, GC, or lifetime annotations"
arch=('x86_64' 'aarch64')
url="https://github.com/aardappel/goose"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
makedepends=('cmake')
optdepends=('gcc: goose build (native executables)'
  'git: fetching packages into ~/.goose')
conflicts=('goose' 'goose-bin' 'goose-cli' 'goose-cli-bin' 'goose-desktop' 'liamstask-goose-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('73ef9aeced4a4a3d93dbb3cb0b65a9a1ec3c0efa6c3d4fa4298211919023a5a4')

build() {
  cmake -S "goose-$pkgver" -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DGOOSE_BUILTIN_LIBS=""
  cmake --build build
}

package() {
  local dest="$pkgdir/usr/lib/$pkgname"
  install -Dm755 build/goose "$dest/goose"
  cp -r build/tcclib "$dest/tcclib"
  cp -r "goose-$pkgver/stdlib" "$dest/stdlib"
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname/goose" "$pkgdir/usr/bin/goose"
  install -Dm644 "goose-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
