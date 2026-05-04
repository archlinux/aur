# Maintainer: SHORiN-KiWATA <fcl709@outlook.com>
pkgname=chwd-arch-git
pkgver=1.21.0.r2.g156025b
pkgrel=1
pkgdesc="CachyOS Hardware Detection Tool Forked for standard Arch Linux"
arch=(x86_64)
url="https://github.com/SHORiN-KiWATA/chwd"
license=(GPL-3.0-or-later)
depends=('gcc-libs' 'pciutils' 'lua' 'pacman' 'libusb')
makedepends=('git' 'cargo' 'lld' 'clang' 'llvm')
provides=('chwd' 'chwd-db')
conflicts=('chwd' 'chwd-db')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"

  cd scripts/chwd-kernel
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$pkgname"

  # Compile with clang
  export AR=llvm-ar
  export CC=clang
  export CXX=clang++
  export NM=llvm-nm
  export RANLIB=llvm-ranlib

  export RUSTFLAGS="-Cembed-bitcode -C opt-level=3 -Ccodegen-units=1 -Clinker=clang -C link-arg=-flto -Clink-arg=-fuse-ld=/usr/bin/ld.lld"

  cd scripts/chwd-kernel
  cargo build --release --frozen

  cd ../../

  cargo build --release --frozen
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 "target/release/chwd" "$pkgdir/usr/bin/chwd"
  install -Dm755 scripts/chwd "$pkgdir"/var/lib/chwd/scripts/chwd

  install -Dm644 target/release/build/chwd-*/out/chwd.bash "$pkgdir/usr/share/bash-completion/completions/chwd"
  install -Dm644 target/release/build/chwd-*/out/chwd.fish "$pkgdir/usr/share/fish/vendor_completions.d/chwd.fish"
  install -Dm644 target/release/build/chwd-*/out/_chwd "$pkgdir/usr/share/zsh/site-functions/_chwd"

  install -d -m755 "$pkgdir"/var/lib/chwd/{db,local}/pci

  # install ids
  install -d -m755 "$pkgdir"/var/lib/chwd/ids
  cp -r ids/* "$pkgdir"/var/lib/chwd/ids

  cp -r profiles/pci "$pkgdir"/var/lib/chwd/db/
  cp -r profiles/usb "$pkgdir"/var/lib/chwd/db/

  cd scripts/chwd-kernel
  install -Dm755 "target/release/chwd-kernel" "$pkgdir/usr/bin/chwd-kernel"
}

# vim:set sw=2 sts=2 et:
