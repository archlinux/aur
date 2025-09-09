# Maintainer: Marco Huenseler <marco@wuthoehle.de>

pkgname=bootupd-git
_pkgname=bootupd
pkgver=0.2.29.r27.g40ab720
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
  "0001-arch-path.patch"
  "0002-arch-packagesystem.patch")
sha256sums=('SKIP'
  '396a33a7c9fdbcfed76715223a5ef415fa540737596283bd263c6673cb4df767'
  'acf820036083aed84c0306c9126fbcf40139b5dc326f8e52cc2eb60aabe367f0')

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
