# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
pkgname=gdscheck
pkgver=0.2.1
pkgrel=1
pkgdesc="A fast, open source Design Rule Check (DRC) engine for GDSII layouts"
arch=("i686" "x86_64" "armv6h" "armv7h")
url="https://github.com/aesc-silicon/gdscheck"
license=('AGPL-3.0-or-later')
depends=(
  "glibc"
  "libgcc"
)
makedepends=(
  "git"
  "cargo"
)
provides=()
conflicts=()
source=("${pkgname}::git+${url}#tag=v${pkgver}")
b2sums=('ffab83f4b99c9b0322e49ea3be9b62851e0fb3e85b7877a3a64c1cb9781c6085ffb0d2bb6f96a0ec7b961444596a7b98d90a86242ffb7168fb3c0cb2f7db6cf4')
options=()

prepare() {
  cd "${pkgname}"

  export RUSTUP_TOOLCHAIN=stable
  # TODO: There is no .lock file in this repo
  cargo fetch --target host-tuple
}

build() {
  cd "${pkgname}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${pkgname}"

  # Generate test patterns
  target/release/gen-testdata --pdk pdks/ihp-sg13g2/pdk.yml

  # Run tests
  cargo test --frozen --all-features
}

package() {
  cd "${pkgname}"
  # Executables
  install -Dm755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
  # # License
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "LICENSE"
}

# vim: set ts=2 sw=2 et:
