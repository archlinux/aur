# Maintainer: Matt Brassey <matt@brassey.io>
pkgname=agtop
pkgver=2.5.0
pkgrel=1
pkgdesc="Terminal UI for monitoring AI coding agents (Claude Code, Codex, Aider, Cursor, Gemini, Goose, ...) — like top, but for agents."
arch=('x86_64' 'aarch64')
url="https://github.com/mbrassey/agtop"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("agtop-${pkgver}.tar.gz::https://github.com/mbrassey/agtop/archive/v${pkgver}.tar.gz")
sha256sums=('89ee7110d43044d777378e91b974869a9f1e688cd399bab51b9d4a0fdf10662e')
options=('!debug')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Vendor cache: respect $CARGO_HOME so makepkg can be reproducible offline.
  export CARGO_HOME="${srcdir}/.cargo"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')" || true
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CARGO_HOME="${srcdir}/.cargo"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Fall back to --locked (not an unpinned build) so the offline path
  # failing doesn't silently compile dependency versions CI never tested;
  # keep stderr so the original error is visible when the fallback runs.
  cargo build --release --frozen || cargo build --release --locked
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CARGO_HOME="${srcdir}/.cargo"
  cargo test --release --frozen || cargo test --release --locked
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  if [ -f README.md ]; then
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  fi
}
