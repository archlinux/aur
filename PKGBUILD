# Maintainer: Christopher Sieh (stelzo) <stelzo@steado.de>
pkgname=minot-bin
pkgver=0.10.1
pkgrel=6
pkgdesc="A versatile toolset for debugging and verifying stateful robot perception software."
arch=('x86_64' 'aarch64')
url="https://codeberg.org/stelzo/minot"
license=('MIT' 'Apache-2.0')
depends=('libgcc' 'glibc')
makedepends=()
options=('!lto' '!strip' '!debug')
source_x86_64=(
  "$pkgname-$pkgver-bin.deb::https://uos-robotics.codeberg.page/ppa/ubuntu/pool/main/noble/minot_$pkgver-1_amd64.deb"
  "$pkgname-$pkgver-dev.deb::https://uos-robotics.codeberg.page/ppa/ubuntu/pool/main/noble/librat-dev_$pkgver-1_amd64.deb"
)
sha256sums_x86_64=('SKIP' 'SKIP')
source_aarch64=(
  "$pkgname-$pkgver-bin.deb::https://uos-robotics.codeberg.page/ppa/ubuntu/pool/main/noble/minot_$pkgver-1_arm64.deb"
  "$pkgname-$pkgver-dev.deb::https://uos-robotics.codeberg.page/ppa/ubuntu/pool/main/noble/librat-dev_$pkgver-1_arm64.deb"
)
sha256sums_aarch64=('SKIP' 'SKIP')
noextract=("$pkgname-$pkgver-bin.deb" "$pkgname-$pkgver-dev.deb")
provides=('minot' 'librat')
conflicts=('minot' 'librat')

prepare() {
  mkdir -p "$srcdir/minot-bin-ext" "$srcdir/minot-dev-ext"

  cd "$srcdir/minot-bin-ext"
  bsdtar -xf "$srcdir/$pkgname-$pkgver-bin.deb"
  tar -xpf data.tar.*

  cd "$srcdir/minot-dev-ext"
  bsdtar -xf "$srcdir/$pkgname-$pkgver-dev.deb"
  tar -xpf data.tar.*
}

build() {
  MINOT_CLI_PATH="$srcdir/minot-bin-ext/usr/bin/minot"
  mkdir -p "$srcdir/completions"
  "$MINOT_CLI_PATH" completions bash > "$srcdir/completions/bash"
  "$MINOT_CLI_PATH" completions zsh  > "$srcdir/completions/_zsh"
  "$MINOT_CLI_PATH" completions fish > "$srcdir/completions/fish"
}

package() {
  install -Dm755 "$srcdir/minot-bin-ext/usr/bin/minot" "$pkgdir/usr/bin/minot"

  install -Dm644 "$srcdir/minot-dev-ext/usr/lib/librat.so" "$pkgdir/usr/lib/librat.so"
  install -Dm644 "$srcdir/minot-dev-ext/usr/lib/librat.a" "$pkgdir/usr/lib/librat.a"
  install -Dm644 "$srcdir/minot-dev-ext/usr/include/rat/rat.h" "$pkgdir/usr/include/rat/rat.h"
  install -Dm644 "$srcdir/minot-dev-ext/usr/lib/pkgconfig/librat.pc" "$pkgdir/usr/lib/pkgconfig/librat.pc"
  install -Dm644 "$srcdir/minot-dev-ext/usr/lib/cmake/minot/libratConfig.cmake" "$pkgdir/usr/lib/cmake/minot/libratConfig.cmake"

  install -Dm644 "$srcdir/completions/bash" "$pkgdir/usr/share/bash-completion/completions/minot"
  install -Dm644 "$srcdir/completions/_zsh" "$pkgdir/usr/share/zsh/site-functions/_minot"
  install -Dm644 "$srcdir/completions/fish" "$pkgdir/usr/share/fish/vendor_completions.d/minot.fish"
}
