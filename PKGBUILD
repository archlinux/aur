# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=fortitude
pkgver=0.10.0
pkgrel=1
pkgdesc='A Fortran linter, inspired by (and built upon) Ruff.'
arch=(x86_64)
url='https://github.com/PlasmaFAIR/fortitude'
license=(MIT)
depends=(glibc libgcc libgit2)
makedepends=(git cargo)
checkdepends=(cargo-nextest)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('c30ffeb8f4b02134bd2d7e0100ac82460dd5481c316847e2231c6a582d0563f0c296e00b49c295bdd61ce1465e3dcbe1c69b787234380ebc12a413aaa04346c2')
b2sums=('2f3f78994a2db564222a2b861e0c8dd123a2d8033fce77376a104d5192dd862c72e07ba48f0e47bc34912063dd6985ef7154a85e044a9902d874051cfcd93823')
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
