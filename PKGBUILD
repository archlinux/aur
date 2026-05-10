# Maintainer: Matt Brassey <matt@brassey.io>
pkgname=agtop
pkgver=2.4.18
pkgrel=1
pkgdesc="Terminal UI for monitoring AI coding agents (Claude Code, Codex, Aider, Cursor, Gemini, Goose, ...) — like top, but for agents."
arch=('x86_64' 'aarch64')
url="https://github.com/mbrassey/agtop"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("agtop-${pkgver}.tar.gz::https://github.com/mbrassey/agtop/archive/v${pkgver}.tar.gz")
sha256sums=('f8529c111fe063d9828c49bb2efa2331398bcc56020ffcc8f2202a530f1aa864')
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
  cargo build --release --frozen 2>/dev/null || cargo build --release
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CARGO_HOME="${srcdir}/.cargo"
  cargo test --release --frozen 2>/dev/null || cargo test --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  if [ -f README.md ]; then
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  fi
}
