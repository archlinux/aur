# Maintainer: tarball <bootctl@gmail.com>

pkgname=bunnymodxt
pkgver=2023.01.16
pkgrel=1
pkgdesc='Speedrun and TAS tool for Half-Life & friends'
url='https://github.com/YaLTeR/BunnymodXT'
arch=(x86_64)
license=(MIT)
depends=(
  bash
  lib32-gcc-libs
  lib32-glibc
  lib32-libglvnd
)
makedepends=(
  boost
  cmake
  lib32-rust
  rust
)

# the proper source archive does not contain links to submodules
source=(
  "$pkgname-$pkgver::git+$url#tag=b52e3c84b9bc9b27c7db78d62eb11971ca37f54c"
  bunnymodxt.sh
)
b2sums=('SKIP' 'SKIP')
install=$pkgname.install

prepare() {
  cd $pkgname-$pkgver
  git submodule update --init --recursive
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev

  cmake --build build
}

package() {
  install -Dm644 $pkgname-$pkgver/LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm755 build/libBunnymodXT.so \
    "$pkgdir"/usr/lib/libBunnymodXT.so

  install -Dm755 bunnymodxt.sh \
    "$pkgdir"/usr/bin/bunnymodxt
}
