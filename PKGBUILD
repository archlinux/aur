# Maintainer: Marco Huenseler <marco@wuthoehle.de>

pkgname=bootupd-git
_pkgname=bootupd
pkgver=0.2.29.r6.gf0fcca8
pkgrel=3
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
  "0001-arch-path.patch"
  "0002-arch-packagesystem.patch")
sha256sums=('SKIP'
  '8e7cd49c37192dd395a0c67af5957fb8d47ea5d92d98ce24b4e5e7612720b878'
  '11b000162975650060f1a2bc9785d250fec0a7bebfdb8b4c36bdd70cff40a813')

prepare() {
  cd "$_pkgname"
  patch -Np1 -i "${srcdir}/0001-arch-path.patch"
  patch -Np1 -i "${srcdir}/0002-arch-packagesystem.patch"
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
