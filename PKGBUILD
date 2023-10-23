# Maintainer: Robert Rosca <32569096+RobertRosca@users.noreply.github.com>
# Contributor: Ford Smith <fms34@case.edu>

pkgname=dura-git
pkgver=v0.2.0.r11.gb4a51b9
pkgrel=1
pkgdesc='Dura is a background process that watches your Git repositories and commits your uncommitted changes'
arch=(x86_64)
url=https://github.com/tkellogg/dura
license=(Apache)
makedepends=(git cargo)
provides=(dura)
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

prepare() {
  cd "${pkgname}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
  cd "${pkgname}"

  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"

  # Hackily pacth Cargo.toml and Cargo.lock to use the pkgver
  _pkgver=$(echo ${pkgver} | sed 's/^v//; s/\.\([a-z]\)/+\1/')
  sed -i=bck "s/^version = \".*\"$/version = \"${_pkgver}\"/" ./Cargo.toml
  sed -i=bck "/\[\[package\]\]/{N;N;/name = \"dura\"\nversion = \"/{s/version = \".*\"/version = \"${_pkgver}\"/}}" ./Cargo.lock

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "${pkgname}"

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "${pkgname}"

  install -Dm755 "target/release/dura" "${pkgdir}/usr/bin/dura"
}
