# Maintainer: Lars Francke <lars.francke@stackable.tech>

# Following: https://wiki.archlinux.org/title/Rust_package_guidelines
# Take the commit from the releases at https://github.com/stackabletech/stackable-cockpit/releases/

_commit=944fa475f49fe146ad718490265a5798710c38d7
pkgname=stackablectl
pkgver=1.3.0
pkgrel=1
# We moved to epoch=1 because we moved from CalVer to SemVer
epoch=1
pkgdesc="Command line tool to interact with a Stackable Data Platform"
arch=('x86_64')
url="https://github.com/stackabletech/stackable-cockpit/"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('go' 'cargo' 'git')
provides=('stackablectl')
conflicts=('stackablectl-bin' 'stackablectl-git')

# Needed due to https://github.com/briansmith/ring/issues/1444 & https://gitlab.archlinux.org/archlinux/packaging/packages/pacman/-/issues/20
options=(!lto)
source=("$pkgname::git+https://github.com/stackabletech/stackable-cockpit.git#commit=$_commit")
b2sums=('53512ceab88b8d1d75fe1b7f55b431f7a0b5a4cb812406b48b58ece1fd6c6b1171583bfa7360c40f9b1407ca38231393681c684b446bcf2767d378436253c979')

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
