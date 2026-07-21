# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=fortitude
pkgver=0.9.1
pkgrel=2
pkgdesc='A Fortran linter, inspired by (and built upon) Ruff.'
arch=(x86_64)
url='https://github.com/PlasmaFAIR/fortitude'
license=(MIT)
depends=(glibc libgcc libgit2)
makedepends=(git cargo)
checkdepends=(cargo-nextest)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('bcbb494ec30e30c3209678a8e3b5224e88bef2eed183405d2e14200425f98c3cdd7aad00b9f9c185a86a9fda4f070ea2209ba2e4da64d99349421c1250b8afea')
b2sums=('8209fab764d736509728d92d9ba580fb161d5fc3ea2082a9a2126109654d9b8316517698da9319f0d33508840878b369d01862a85d5e544d4e802b900b33ed7b')
options=('!lto')

prepare() {
  cd "$pkgname" || exit

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {

  cd "$pkgname" || exit

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export LIBGIT2_NO_VENDOR=1
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname" || exit

  export RUSTUP_TOOLCHAIN=stable
  # Upstream specifically recommends using nextest in CONTRIBUTING.md
  cargo nextest run
}

package() {
  cd "$pkgname" || exit

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
