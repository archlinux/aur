# Maintainer: Fabio Fontana (fabifont) <me@fabifont.dev>

_pkgname="flatten"
pkgname="${_pkgname}-git"
pkgver=0.2.0.r0.g0000000
pkgrel=1
pkgdesc="Rust CLI and library for exporting a project tree into one deterministic representation"
arch=("x86_64")
url="https://github.com/fabifont/flatten"
license=("MIT" "Apache-2.0")

depends=("gcc-libs")
makedepends=("cargo" "git")

provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin")

source=("git+${url}.git")
sha256sums=("SKIP")
b2sums=("SKIP")

pkgver() {
  cd "${_pkgname}"
  local version
  version="$(sed -n 's/^version = "\(.*\)"/\1/p' Cargo.toml | head -n1)"
  printf "%s.r%s.g%s" "${version}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export CARGO_TARGET_DIR=target

  cd "${_pkgname}"
  cargo build --release --frozen --all-features
}

check() {
  export CARGO_TARGET_DIR=target

  cd "${_pkgname}"
  cargo test --frozen --all-features
}

package() {
  cd "${_pkgname}"
  install -Dm755 -t "${pkgdir}/usr/bin/" "target/release/${_pkgname}"
  install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
  install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE"
}
