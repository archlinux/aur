# Maintainer: metaneutrons <aur@metaneutrons.github.io>
pkgname=pfs3
pkgver=0.1.5
pkgrel=1
pkgdesc="PFS3 (Amiga Professional File System III) tools"
arch=('x86_64' 'aarch64')
url="https://github.com/metaneutrons/pfs3"
license=('LGPL-3.0-or-later')
depends=()
makedepends=('cargo' 'pkgconf')
# Measured from the real tar listing rather than assumed from the tag
# or from $pkgver. A prerelease tag makes the two differ: the archive
# root carries the full tag while pkgver carries the release core.
_srcdir='pfs3-0.1.5'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/metaneutrons/pfs3/archive/refs/tags/v0.1.5.tar.gz")
sha256sums=('c0e79bf2382bfc118aff936e875b35606d7aa94466e5fcda97b72c9bbc7bb3cb')

prepare() {
  cd "$_srcdir"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_srcdir"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p pfs3
}

package() {
  cd "$_srcdir"
  install -Dm755 "target/release/pfs3" "$pkgdir/usr/bin/pfs3"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
