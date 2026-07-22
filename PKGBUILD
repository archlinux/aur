# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=fortitude
pkgver=0.9.2
pkgrel=1
pkgdesc='A Fortran linter, inspired by (and built upon) Ruff.'
arch=(x86_64)
url='https://github.com/PlasmaFAIR/fortitude'
license=(MIT)
depends=(glibc libgcc libgit2)
makedepends=(git cargo)
checkdepends=(cargo-nextest)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('ff10d6e9c3f88dcc0bb56ffb57bd1e53c6316d8164b4ca27a2dd87bf880bfc26291781af1020755f1314fe04ad7fa7818acbb5cb0f64492b91cffa62f305afba')
b2sums=('56840e3d7aea8215c41e7e2b02754aebb37cacab41e742c657966aadd7615357bfd7028da6321dabc871121da9dbfcad750c2d623d94391a6cc7b558f1e3da67')
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
