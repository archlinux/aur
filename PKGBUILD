# Maintainer: Oliver Jan Krylow <oliver@bugabinga.net>

_pkgname=nufmt
pkgname=nufmt-git
pkgver=0.1.0.r75.gf178d80
pkgrel=1
pkgdesc="Formatter for Nushell source code"
arch=('x86_64')
url="https://github.com/nushell/nufmt"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('nufmt')
conflicts=('nufmt')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  local version revision commit
  version=$(awk -F '"' '/^version =/ { print $2; exit }' Cargo.toml)
  revision=$(git rev-list --count HEAD)
  commit=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "${version}" "${revision}" "${commit}"
}

prepare() {
  cd "${_pkgname}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "${_pkgname}"
  export CARGO_HOME="${srcdir}/cargo-home"
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=${srcdir}=/build"
  cargo build --frozen --release
}

check() {
  cd "${_pkgname}"
  export CARGO_HOME="${srcdir}/cargo-home"
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=${srcdir}=/build"
  cargo test --frozen --release --lib --bins
}

package() {
  cd "${_pkgname}"
  install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
