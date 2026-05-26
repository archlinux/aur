# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_upstreamname="uniffi-rs"
_pkgname="uniffi-bindgen"
pkgname="${_pkgname}-git"
pkgver=0.31.1+85.r2144.20260526.190fda27d
pkgrel=1
pkgdesc="A multi-language bindings generator for Rust."
arch=(
  "aarch64"
  "armv7h"
  "armv8h"
  "loong64"
  "i686"
  "x86_64"
)
url="https://github.com/mozilla/${_upstreamname}"
license=('MPL-2.0')
conflicts=(
  "${_pkgname}"
  "${_pkgname}-bin"
)
provides=(
  "${_pkgname}=${pkgver}"
)
makedepends=(
  "git"
  "cargo-nightly"
)
depends=(
  "glibc"
  "libgcc_s.so"
)
optdepends=()
source=(
  "${_pkgname}::git+${url}.git"
)
sha256sums=(
  'SKIP'
)
#options+=('!lto' 'debug' '!strip')

prepare() {
  cd ${srcdir}/${_pkgname}

  export RUSTUP_HOME="${srcdir}/.rustup"
  #export RUSTUP_TOOLCHAIN=stable
  export RUSTUP_TOOLCHAIN=nightly
  export CARGO_HOME="${srcdir}/.cargo"
  export CARGO_TARGET_DIR=target

  printf '%s\n' " --> Fetching rust dependencies ..."
  cargo fetch --locked --target host-tuple

  printf '%s\n' " --> Generating git log ..."
  git log > git.log
}

pkgver() {
  cd ${srcdir}/${_pkgname}

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' -e 's|-(sc)|.\1|' -e 's|-([0-9]+)$|+\1|')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd ${srcdir}/${_pkgname}

  export RUSTUP_HOME="${srcdir}/.rustup"
  #export RUSTUP_TOOLCHAIN=stable
  export RUSTUP_TOOLCHAIN=nightly
  export CARGO_HOME="${srcdir}/.cargo"
  export CARGO_TARGET_DIR=target

  printf '%s\n' " --> Building ..."
  cargo build --frozen --release --all-features -p uniffi_bindgen
}

## check() disables: Recompiles, which takes looong.
# check() {
#   cd ${srcdir}/${_pkgname}
# 
#   export RUSTUP_HOME="${srcdir}/.rustup"
#   #export RUSTUP_TOOLCHAIN=stable
#   export RUSTUP_TOOLCHAIN=nightly
#   export CARGO_HOME="${srcdir}/.cargo"
#   export CARGO_TARGET_DIR=target
# 
#   cargo test --frozen --release --all-features -p uniffi_bindgen
# }

package() {
  cd ${srcdir}/${_pkgname}

  export RUSTUP_HOME="${srcdir}/.rustup"
  #export RUSTUP_TOOLCHAIN=stable
  export RUSTUP_TOOLCHAIN=nightly
  export CARGO_HOME="${srcdir}/.cargo"
  export CARGO_TARGET_DIR=target

  install -Dvm755 -t "${pkgdir}/usr/bin" target/release/uniffi-bindgen
  # install -Dvm755 -t "${pkgdir}/usr/lib/${_pkgname}" target/release/*.so

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" git.log CHANGELOG.md CODE_OF_CONDUCT.md README.md
  cp -rv docs examples "${pkgdir}/usr/share/doc/${_pkgname}/"

  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
