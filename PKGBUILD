# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=fortitude
pkgver=0.10.1
pkgrel=1
pkgdesc='Fortran linter, inspired by (and built upon) Ruff'
arch=(x86_64)
url='https://github.com/PlasmaFAIR/fortitude'
license=(MIT)
depends=(glibc libgcc libgit2)
makedepends=(git cargo)
checkdepends=(cargo-nextest)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('434069c91bc970471ec174de0ab8d97a0b73ea4c89df2c31752d2a159a5c022acc9bb82d7be4c7867897353e38c9bd1e82f59f02bfe963713312ecd814f185a8')
b2sums=('b00896c1e02eb99e8b0c26baecb431054ae9c864a7d4495fa635ad3027d93a7b94c47896cda16efe71d9de838b52192d59c2deff8cf1706cc8e854d6df62fb3d')
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
  export CARGO_TARGET_DIR=target
  export LIBGIT2_NO_VENDOR=1
  # Upstream specifically recommends using nextest in CONTRIBUTING.md
  cargo nextest run --frozen --release --all-features
}

package() {
  cd "$pkgname" || exit

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
