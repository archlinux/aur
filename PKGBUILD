# Maintainer: Hec <hec@heccraft.com>

pkgname=bootupd-git
_pkgname=bootupd
pkgver=0.4.0.r1.g8a66d87
pkgrel=1
pkgdesc="Bootloader updater"
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url="https://github.com/coreos/bootupd"
license=('Apache-2.0')
depends=(gcc-libs
  glibc
  grub
  efibootmgr)
makedepends=(cargo
  git)
provides=("bootupd=$pkgver")
conflicts=('bootupd')
source=("git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 --match="v*" HEAD |
    sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  make
}

check() {
  cd "$_pkgname"
  RUST_BACKTRACE=1 cargo test
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install-grub-static
  make DESTDIR="$pkgdir" install-systemd-unit
}
