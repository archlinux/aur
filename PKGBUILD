# Maintainer: metaneutrons <aur@metaneutrons.github.io>
pkgname=pfs3-fuse
pkgver=0.1.4
pkgrel=1
pkgdesc="FUSE driver for PFS3 (Amiga) disk images"
arch=('x86_64' 'aarch64')
url="https://github.com/metaneutrons/pfs3"
license=('LGPL-3.0-or-later')
depends=('fuse3')
makedepends=('cargo' 'pkgconf')
# Measured from the real tar listing rather than assumed from the tag
# or from $pkgver. A prerelease tag makes the two differ: the archive
# root carries the full tag while pkgver carries the release core.
_srcdir='pfs3-0.1.4'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/metaneutrons/pfs3/archive/refs/tags/v0.1.4.tar.gz")
sha256sums=('30f2513c6c72bb73edcb1ce6953c774211a5982fe63e9cad8dbac31fae841fdc')

prepare() {
  cd "$_srcdir"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_srcdir"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p pfs3-fuse
}

package() {
  cd "$_srcdir"
  install -Dm755 "target/release/pfs3-fuse" "$pkgdir/usr/bin/pfs3-fuse"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
