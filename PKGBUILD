#shellcheck shell=bash
# AUR Maintainer: Shadichy <shadichy@blisslabs.org>

pkgname=payload2iso
pkgver=0.1.0
pkgrel=1
pkgdesc="BlissOS OTA payload-to-ISO converter"
arch=('x86_64' 'aarch64')
url="https://github.com/shadichy/payload2iso"
license=('GPL-3.0-or-later')

depends=(
  'bzip2'
  'erofs-utils'
  'gcc-libs'
  'glibc'
  'grub'
  'libisoburn'
  'squashfs-tools'
  'xz'
)

optdepends=(
  'dosfstools: for EFI boot support in grub-mkrescue'
  'mtools: for FAT/EFI filesystem staging in grub-mkrescue'
  'e2fsprogs: for debugfs inspection of ext4 images'
  'crau-nbd: for zero-scratch NBD block device mapping'
)

makedepends=(
  'cargo'
  'protobuf'
)

checkdepends=(
  'p7zip'
)

provides=('p2i' 'payload2iso')
conflicts=('payload2iso-git')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/shadichy/payload2iso/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7c9d2e5426bc4e2e74c1eca544ad22e3641b471872249ac297ef10f8b7d153f8')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release
}

check() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test
}

package() {
  cd "${pkgname}-${pkgver}"

  # Binaries
  install -Dm755 "target/release/p2i" "${pkgdir}/usr/bin/p2i"
  ln -s p2i "${pkgdir}/usr/bin/payload2iso"

  # Default GRUB assets
  install -d "${pkgdir}/usr/share/p2i/assets"
  if [ -d "assets" ]; then
    cp -r assets/* "${pkgdir}/usr/share/p2i/assets/"
  fi

  # License & documentation
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 NEWS "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  install -Dm644 ChangeLog "${pkgdir}/usr/share/doc/${pkgname}/ChangeLog"
}
