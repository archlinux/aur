# Maintainer: Hec <hec@heccraft.com>

pkgname=bootupd
pkgver=0.2.32
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
source=("$url/archive/refs/tags/v0.2.32.tar.gz"
  "0001-arch-path.patch"
  "0002-arch-packagesystem.patch")
sha256sums=('0924fb7ec2614e35fbdc1005879fcf7bdc4ffa422dcc4da04951a3b970339448'
            '396a33a7c9fdbcfed76715223a5ef415fa540737596283bd263c6673cb4df767'
            'acf820036083aed84c0306c9126fbcf40139b5dc326f8e52cc2eb60aabe367f0')

prepare() {
  tar xvf "v$pkgver.tar.gz"
  cd "$pkgname-$pkgver"
  patch -Np1 -i "${srcdir}/0001-arch-path.patch"
  patch -Np1 -i "${srcdir}/0002-arch-packagesystem.patch"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  make
}

check() {
  cd "$pkgname-$pkgver"
  RUST_BACKTRACE=1 cargo test
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install-grub-static
  make DESTDIR="$pkgdir" install-systemd-unit
}
