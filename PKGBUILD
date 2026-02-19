# Maintainer: Christopher Sieh (stelzo) <stelzo@steado.de>
pkgname=pelorus-bin
pkgver=0.0.1
pkgrel=1
pkgdesc="Highly efficient Lidar Inertial Odometry."
arch=('x86_64')
url="https://codeberg.org/stelzo/pelorus"
license=('MIT' 'Apache-2.0')
depends=('libgcc' 'glibc' 'minot-bin')
makedepends=()
options=('!lto' '!strip' '!debug')
source=("$pkgname-$pkgver-bin.deb::https://uos-robotics.codeberg.page/ppa/ubuntu/pool/main/noble/pelorus_$pkgver-1_amd64.deb" "$pkgname-$pkgver-bin-lib.deb::https://uos-robotics.codeberg.page/ppa/ubuntu/pool/main/noble/libpelorus_$pkgver-1_amd64.deb")
noextract=("$pkgname-$pkgver-bin.deb" "$pkgname-$pkgver-bin-lib.deb")
sha256sums=('SKIP' 'SKIP')
provides=('pelorus' 'libpelorus')
#conflicts=('pelorus' 'libpelorus')

prepare() {
  mkdir -p "$srcdir/pelorus-bin-ext" "$srcdir/pelorus-lib-ext"
  cd "$srcdir/pelorus-bin-ext"
  bsdtar -xf "$srcdir/$pkgname-$pkgver-bin.deb"
  tar -xpf data.tar.*

  cd "$srcdir/pelorus-lib-ext"
  bsdtar -xf "$srcdir/$pkgname-$pkgver-bin-lib.deb"
  tar -xpf data.tar.*
}

package() {
  install -Dm755 "$srcdir/pelorus-lib-ext/usr/lib/libpelorus.so" "$pkgdir/usr/lib/libpelorus.so"
  install -Dm644 "$srcdir/pelorus-lib-ext/usr/lib/libpelorus.a" "$pkgdir/usr/lib/libpelorus.a"

  install -Dm755 "$srcdir/pelorus-bin-ext/usr/bin/pelorus" "$pkgdir/usr/bin/pelorus"

  "$pkgdir/usr/bin/pelorus" completions bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/pelorus"
  "$pkgdir/usr/bin/pelorus" completions zsh  | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_pelorus"
  "$pkgdir/usr/bin/pelorus" completions fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/pelorus.fish"
}
