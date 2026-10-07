# Maintainer: Your Name <you@example.com>
pkgname=herdr
pkgver=0.9.3
pkgrel=1
pkgdesc='Terminal workspace manager for AI coding agents'
arch=('x86_64' 'aarch64')
url='https://herdr.dev'
license=('AGPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git' 'zig=0.16.0')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ogulcancelik/herdr/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e48f6706440c92362773663131ef5b524c62549523e50a03f2b55d315edca100')
_zig=/usr/bin/zig

prepare() {
  cd "${pkgname}-${pkgver}"

  export CARGO_HOME="${srcdir}/cargo-home"
  export ZIG_GLOBAL_CACHE_DIR="${srcdir}/zig-cache"
  export PATH="${_zig%/*}:${PATH}"

  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"

  cd vendor/libghostty-vt
  local attempt
  for attempt in 1 2 3; do
    if "${_zig}" build --fetch=all; then
      return 0
    fi
    if (( attempt < 3 )); then
      sleep 2
    fi
  done
  return 1
}

build() {
  cd "${pkgname}-${pkgver}"

  export CARGO_HOME="${srcdir}/cargo-home"
  export ZIG_GLOBAL_CACHE_DIR="${srcdir}/zig-cache"
  export PATH="${_zig%/*}:${PATH}"
  export ZIG="${_zig}"
  export HERDR_BUILD_CHANNEL=stable
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=${srcdir}=/usr/src/debug/${pkgname}"
  export CARGO_TARGET_DIR=target

  cargo build --release --frozen
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -d "${pkgdir}/usr/share/bash-completion/completions"
  install -d "${pkgdir}/usr/share/fish/vendor_completions.d"
  install -d "${pkgdir}/usr/share/zsh/site-functions"
  "target/release/${pkgname}" completion bash > "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  "target/release/${pkgname}" completion fish > "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  "target/release/${pkgname}" completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
