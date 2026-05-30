# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname="multiverse"
pkgname="${_pkgname}-git"
pkgver=0.1.0.r229.20260527.9f0471d52
pkgrel=1
pkgdesc="Debug-oriented console Matrix client, built on top of the Matrix Rust SDK, and reference client for Matrix Rust SDK."
arch=(
  "aarch64"
  "armv7h"
  "armv8h"
  "loong64"
  "i686"
  "x86_64"
)
#url="https://matrix.org/blog/2025/04/11/this-week-in-matrix-2025-04-11/#multiverse"
url="https://github.com/matrix-org/matrix-rust-sdk/blob/main/labs/README.md#current-experiments#:~:text=multiverse:"
_url_matrix_rust_sdk="https://github.com/matrix-org/matrix-rust-sdk"
license=('Apache-2.0')
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "${_pkgname}-bin"
)
replaces=()
makedepends=(
  "git"
  "cargo"
  "sqlite"
)
depends=(
  'glibc'
  'libgcc'
  'libsqlite3.so'
)
optdepends=()
source=(
  "matrix-rust-sdk::git+${_url_matrix_rust_sdk}.git"
)
sha256sums=(
  'SKIP'  # matrix-rust-sdk
)
#options+=('!lto' 'debug' '!strip')
options+=('!lto')



prepare() {
  cd "${srcdir}/matrix-rust-sdk/labs/multiverse"

  export RUSTUP_HOME="${srcdir}/.rustup"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="${srcdir}/.cargo"
  export CARGO_TARGET_DIR=target

  printf '%s\n' " --> Downloading rust dependencies ..."
  cargo fetch --locked --target host-tuple

  printf '%s\n' " --> Generating git log ..."
  git log . > git.log
}



pkgver() {
  cd "${srcdir}/matrix-rust-sdk/labs/multiverse"

  #_ver="$(git describe --tags | sed -E -e 's|matrix-sdk-ffi/||' -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' -e 's|-([0-9]+)$|+\1|')"
  _ver="$(grep -E '^[[:space:]]*version[[:space:]]*=' Cargo.toml | sed 's|#.*||' | awk -F= '{print $2}' | tr -d \'\"[[:space:]])"
  _rev="$(git rev-list --count HEAD .)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad" .)"
  _hash="$(git log -1 --format="%h" .)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}



build() {
  cd "${srcdir}/matrix-rust-sdk/labs/multiverse"

  export RUSTUP_HOME="${srcdir}/.rustup"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="${srcdir}/.cargo"
  export CARGO_TARGET_DIR=target

  printf '%s\n' " --> Building ..."
  cargo build -j1 --frozen --release --all-features
}



check() {
  cd "${srcdir}/matrix-rust-sdk/labs/multiverse"

  export RUSTUP_HOME="${srcdir}/.rustup"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="${srcdir}/.cargo"
  export CARGO_TARGET_DIR=target

  printf '%s\n' " --> Checking ..."
  cargo test -j1 --frozen --release --all-features
}



package() {
  cd "${srcdir}/matrix-rust-sdk/labs/multiverse"

  export RUSTUP_HOME="${srcdir}/.rustup"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="${srcdir}/.cargo"
  export CARGO_TARGET_DIR=target

  printf '%s\n' " --> Installing main application ..."
  install -Dvm755 -t "${pkgdir}/usr/bin" target/release/multiverse

  printf '%s\n' " --> Installing basic documentation ..."
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" git.log ../README.md 
  printf '%s\n' " --> Installing license ..."
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/matrix-rust-sdk/LICENSE"
}
