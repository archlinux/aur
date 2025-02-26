# Maintainer: Liam <lj3954@protonmail.com>

pkgname="quickemu-rs"
pkgver="2.0.1"
pkgrel="1"
pkgdesc="Create and manage macOS, Linux, and Windows virtual machines with intuitive configuration"
arch=('x86_64' 'aarch64')
url="https://github.com/lj3954/$pkgname"
license=('GPL-3.0-only')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9848df97c515de8a37511c10b18990a91c6517865f892542bb8d38f7ba38a43c')
makedepends=('cargo' 'zlib')
depends=('qemu-desktop' 'spice-gtk' 'swtpm' 'edk2-ovmf' 'glibc' 'gcc-libs' 'bzip2' 'xz')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN="stable"
  export CARGO_TARGET_DIR="target"
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/quickemu-rs" -t "$pkgdir/usr/bin"
  install -Dm755 "target/release/quickget-rs" -t "$pkgdir/usr/bin"
}

# vim: ts=2 sw=2 et:
