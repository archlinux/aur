# Maintainer: horizzon3507 <148660626+horizzon3507@users.noreply.github.com>
# Upstream: https://github.com/horizzon3507/stfu

pkgname=stfu
pkgver=0.2.0
pkgrel=1
pkgdesc="Kill switch for all microphones (PipeWire/WirePlumber)"
arch=('x86_64' 'aarch64')
url="https://github.com/horizzon3507/stfu"
license=('MIT')
depends=('gcc-libs' 'wireplumber' 'systemd')
makedepends=('cargo')
provides=('stfu')
conflicts=('stfu-bin' 'stfu-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/horizzon3507/stfu/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('064b55dea1e2d18387f453f67f195a94e56cb4790b123dacd0190b4805fde4b0')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export STFU_OUT_DIR="${srcdir}/assets"
  cargo build --frozen --release
}

check() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  cd "${pkgname}-${pkgver}"

  # Binary
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Shell completions
  install -Dm644 "${srcdir}/assets/completions/stfu.bash" \
    "${pkgdir}/usr/share/bash-completion/completions/${pkgname}" 2>/dev/null || true
  install -Dm644 "${srcdir}/assets/completions/_stfu" \
    "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}" 2>/dev/null || true
  install -Dm644 "${srcdir}/assets/completions/stfu.fish" \
    "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish" 2>/dev/null || true

  # Manpage
  if [[ -f "${srcdir}/assets/man/stfu.1" ]]; then
    install -Dm644 "${srcdir}/assets/man/stfu.1" \
      "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  fi

  # Documentation
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md" 2>/dev/null || true
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md" 2>/dev/null || true
}
