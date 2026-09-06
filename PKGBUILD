# Maintainer: Christopher Sieh (stelzo) <stelzo@steado.de>
pkgname=pelorus-bin
pkgver=0.0.6
pkgrel=1
pkgdesc="Highly efficient Lidar Inertial Odometry."
arch=('x86_64' 'aarch64')
url="https://codeberg.org/stelzo/pelorus"
license=('MIT' 'Apache-2.0')
depends=('libgcc' 'glibc' 'minot>=0.8.0' 'minot<0.9.0')
makedepends=()
options=('!lto' '!strip' '!debug')
source_x86_64=(
  "$pkgname-$pkgver-bin.deb::https://uos-robotics.codeberg.page/ppa/ubuntu/pool/main/noble/pelorus_$pkgver-1_amd64.deb"
  "$pkgname-$pkgver-bin-lib.deb::https://uos-robotics.codeberg.page/ppa/ubuntu/pool/main/noble/libpelorus_$pkgver-1_amd64.deb"
  "$pkgname-$pkgver-bin-dev.deb::https://uos-robotics.codeberg.page/ppa/ubuntu/pool/main/noble/libpelorus-dev_$pkgver-1_amd64.deb"
)
sha256sums_x86_64=('SKIP' 'SKIP' 'SKIP')
source_aarch64=(
  "$pkgname-$pkgver-bin.deb::https://uos-robotics.codeberg.page/ppa/ubuntu/pool/main/noble/pelorus_$pkgver-1_arm64.deb"
  "$pkgname-$pkgver-bin-lib.deb::https://uos-robotics.codeberg.page/ppa/ubuntu/pool/main/noble/libpelorus_$pkgver-1_arm64.deb"
  "$pkgname-$pkgver-bin-dev.deb::https://uos-robotics.codeberg.page/ppa/ubuntu/pool/main/noble/libpelorus-dev_$pkgver-1_arm64.deb"
)
sha256sums_aarch64=('SKIP' 'SKIP' 'SKIP')
noextract=("$pkgname-$pkgver-bin.deb" "$pkgname-$pkgver-bin-lib.deb" "$pkgname-$pkgver-bin-dev.deb")
provides=('pelorus' 'libpelorus')
conflicts=('pelorus' 'libpelorus')

prepare() {
  mkdir -p "$srcdir/pelorus-bin-ext" "$srcdir/pelorus-lib-ext" "$srcdir/pelorus-dev-ext"
  cd "$srcdir/pelorus-bin-ext"
  bsdtar -xf "$srcdir/$pkgname-$pkgver-bin.deb"
  tar -xpf data.tar.*

  cd "$srcdir/pelorus-lib-ext"
  bsdtar -xf "$srcdir/$pkgname-$pkgver-bin-lib.deb"
  tar -xpf data.tar.*

  cd "$srcdir/pelorus-dev-ext"
  bsdtar -xf "$srcdir/$pkgname-$pkgver-bin-dev.deb"
  tar -xpf data.tar.*
}

build() {
  mkdir -p "$srcdir/completions"
  "$srcdir/pelorus-bin-ext/usr/bin/pelorus" completions bash > "$srcdir/completions/bash"
  "$srcdir/pelorus-bin-ext/usr/bin/pelorus" completions zsh  > "$srcdir/completions/_zsh"
  "$srcdir/pelorus-bin-ext/usr/bin/pelorus" completions fish > "$srcdir/completions/fish"
}

package() {
  install -Dm755 "$srcdir/pelorus-lib-ext/usr/lib/libpelorus.so" "$pkgdir/usr/lib/libpelorus.so"
  install -Dm644 "$srcdir/pelorus-lib-ext/usr/lib/libpelorus.a" "$pkgdir/usr/lib/libpelorus.a"

  install -Dm755 "$srcdir/pelorus-bin-ext/usr/bin/pelorus" "$pkgdir/usr/bin/pelorus"

  install -Dm644 "$srcdir/pelorus-dev-ext/usr/include/pelorus.h" "$pkgdir/usr/include/pelorus.h"
  install -Dm644 "$srcdir/pelorus-dev-ext/usr/include/pelorus.hpp" "$pkgdir/usr/include/pelorus.hpp"
  install -Dm644 "$srcdir/pelorus-dev-ext/usr/lib/pkgconfig/pelorus.pc" "$pkgdir/usr/lib/pkgconfig/pelorus.pc"
  install -Dm644 "$srcdir/pelorus-dev-ext/usr/lib/cmake/pelorus/pelorusConfig.cmake" "$pkgdir/usr/lib/cmake/pelorus/pelorusConfig.cmake"

  install -Dm644 "$srcdir/completions/bash" "$pkgdir/usr/share/bash-completion/completions/pelorus"
  install -Dm644 "$srcdir/completions/_zsh" "$pkgdir/usr/share/zsh/site-functions/_pelorus"
  install -Dm644 "$srcdir/completions/fish" "$pkgdir/usr/share/fish/vendor_completions.d/pelorus.fish"
}
