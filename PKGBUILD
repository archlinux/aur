# Maintainer: Hec <hec@heccraft.com>

pkgname=bootupd
pkgver=0.4.0 # renovate: datasource=github-releases depName=coreos/bootupd
pkgrel=1
pkgdesc="Bootloader updater"
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url="https://github.com/coreos/bootupd"
license=('Apache-2.0')
depends=(gcc-libs
  glibc
  grub
  efibootmgr)
makedepends=(cargo)
source=("git+$url.git#tag=v$pkgver")
sha256sums=('c1587c45bc6a679d0da7b4419c34cc5ac8d1499168da62cf23d00b4d1860aebb')

prepare() {
  cd "$pkgname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  make
}

check() {
  cd "$pkgname"
  RUST_BACKTRACE=1 cargo test
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install-grub-static
  make DESTDIR="$pkgdir" install-systemd-unit
}
