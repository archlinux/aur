# Maintainer: Lars Francke <lars.francke@stackable.tech>

# Following: https://wiki.archlinux.org/title/Rust_package_guidelines
# Take the commit from the releases at https://github.com/stackabletech/stackablectl/releases/

_commit=6357a127771c5cce1df7d4466684dfbde8a8d17f
pkgname=stackablectl
pkgver=1.5.1
pkgrel=1
# We moved to epoch=1 because we moved from CalVer to SemVer
epoch=1
pkgdesc="Command line tool to interact with a Stackable Data Platform"
arch=('x86_64')
url="https://github.com/stackabletech/stackablectl/"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('go' 'cargo' 'git')
provides=('stackablectl')
conflicts=('stackablectl-bin' 'stackablectl-git')

# Needed due to https://github.com/briansmith/ring/issues/1444 & https://gitlab.archlinux.org/archlinux/packaging/packages/pacman/-/issues/20
options=(!lto)
source=("$pkgname::git+https://github.com/stackabletech/stackablectl.git#commit=$_commit")
b2sums=('07518f4bdb566f5f68894dfe739344ec4dbe7eb6970403587a80d2af7525cded09baacd692002c6189452b3c83114ae9fe6b2972229c392ab8242d7f343fb194')

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features -p stackablectl
}

check() {
  cd "$pkgname"
  cargo test --frozen --all-features -p stackablectl
}

package() {
  cd "$pkgname"
  install -vDm755 -t "$pkgdir/usr/bin" target/release/stackablectl
}
