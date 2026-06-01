# Maintainer: Marco Huenseler <marco@wuthoehle.de>

pkgname=bootupd-git
_pkgname=bootupd
pkgver=0.2.34.r13.ge2c0dc9
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
source=("git+$url.git"
  "0001-Modify-grub-paths-to-match-Arch-Linux.patch")
sha256sums=('SKIP'
            '331cee421eab47415f9e4f0101ada3b0154db8ab42d2b2a4b4b7218ffb2ff3ca')

prepare() {
  cd "$_pkgname"
  patch -Np1 -i "${srcdir}/0001-Modify-grub-paths-to-match-Arch-Linux.patch"
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
