# Maintainer: Your Name <you@example.com>
pkgname=herdr
pkgver=0.8.2
pkgrel=1
pkgdesc='Terminal workspace manager for AI coding agents'
arch=('x86_64' 'aarch64')
url='https://herdr.dev'
license=('AGPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git' 'zig0.15')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ogulcancelik/herdr/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('60453051025ee44ebf055d26cdaf665a0accd99a992cddd22c166a26c49cd161')
_zig=/opt/zig0.15/zig

prepare() {
  cd "${pkgname}-${pkgver}"

  export CARGO_HOME="${srcdir}/cargo-home"
  export ZIG_GLOBAL_CACHE_DIR="${srcdir}/zig-cache"
  export PATH="${_zig%/*}:${PATH}"

  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"

  local zig_seen="${srcdir}/zig-fetch-seen"
  local zig_urls="${srcdir}/zig-fetch-urls"
  : > "${zig_seen}"
  while true; do
    find vendor/libghostty-vt "${ZIG_GLOBAL_CACHE_DIR}" -name build.zig.zon \
      -exec sed -n 's/^[[:space:]]*\.url = "\(.*\)",/\1/p' {} + 2>/dev/null \
      | sort -u > "${zig_urls}"

    local fetched=0
    while IFS= read -r zig_url; do
      if grep -Fxq "${zig_url}" "${zig_seen}"; then
        continue
      fi
      local zig_ok=0
      for _ in 1 2 3; do
        if "${_zig}" fetch --global-cache-dir "${ZIG_GLOBAL_CACHE_DIR}" "${zig_url}"; then
          zig_ok=1
          break
        fi
        sleep 2
      done
      (( zig_ok == 1 ))
      printf '%s\n' "${zig_url}" >> "${zig_seen}"
      fetched=1
    done < "${zig_urls}"

    (( fetched == 0 )) && break
  done
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
