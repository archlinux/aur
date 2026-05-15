# Maintainer: Lucas Rooyakkers <lucas.rooyakkers@pm.me>

pkgname=aodv-git
pkgver=0.2.0.r18.g2368069
pkgrel=1
pkgdesc="Userspace RFC 3561 ad hoc routing control-plane daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/Fierthraix/aodv-rs"
license=('MIT OR Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
provides=('aodv')
conflicts=('aodv')
source=("aodv::git+ssh://git@github.com/Fierthraix/aodv-rs.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd aodv

  printf "%s.r%s.g%s" \
    "$(awk -F\" '/^version = / { print $2; exit }' Cargo.toml)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd aodv

  export RUSTUP_TOOLCHAIN=stable
  cargo generate-lockfile
  cargo fetch --locked
}

build() {
  cd aodv

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd aodv

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --all-targets --all-features
}

package() {
  cd aodv

  install -Dm755 "target/release/aodv" "$pkgdir/usr/bin/aodv"
}
