# Maintainer: Hec <hec@heccraft.com>

pkgname=bootupd
pkgver=0.2.34 # renovate: datasource=github-releases depName=coreos/bootupd
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
source=("git+$url.git#tag=v$pkgver"
  "0001-Modify-grub-paths-to-match-Arch-Linux.patch")
sha256sums=('e2e75bc31710b3ae16481a73c72cc9db0219e077f21af88d476756dcef5631cb'
            '331cee421eab47415f9e4f0101ada3b0154db8ab42d2b2a4b4b7218ffb2ff3ca')

prepare() {
  cd "$pkgname"
  patch -Np1 -i "${srcdir}/0001-Modify-grub-paths-to-match-Arch-Linux.patch"
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
