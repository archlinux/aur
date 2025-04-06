# Maintainer: Fabio Fontana (fabifont) <me@fabifont.dev>

_pkgname="flatten"
pkgname="${_pkgname}-git"
pkgver=0
pkgrel=1
pkgdesc="CLI tool to merge file contents with a tree view, respecting .gitignore and .flattenignore"
arch=("x86_64")
url="https://github.com/fabifont/flatten"
license=("GPL-3.0-or-later")

makedepends=("cargo" "git")

provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

source=("git+${url}")
sha256sums=("SKIP")
b2sums=("SKIP")

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  export RUSTUP_TOOLCHAIN=nightly

  cd "${_pkgname}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=nightly
  export CARGO_TARGET_DIR=target

  cd "${_pkgname}"
  cargo build --release --frozen --all-features
}

package() {
  cd "${_pkgname}"
  install -Dm755 -t "${pkgdir}/usr/bin/" "target/release/${_pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
