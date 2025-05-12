# Maintainer: tarball <bootctl@gmail.com>

pkgname=bunnymodxt
pkgver=2024.11.11
_commit=cbc496b1ba7f6c242a961c33f16d3b5741371dd6
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
  "$pkgname-$pkgver::git+$url#tag=$_commit"
  bunnymodxt.sh
)
b2sums=('SKIP'
        '76a234819827003035a02407877a5f050ebf2dbc64c42bd65667422d62d2493d233ce47e7bbbd876f955923b12849e6728f7f9fa7001bf31a3641b6dbf295c0f')
install=$pkgname.install

prepare() {
  cd $pkgname-$pkgver
  git submodule update --init --recursive
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
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
