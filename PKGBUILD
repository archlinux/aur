# Maintainer: robertfoster
pkgname=rmpd-git
pkgver=r54.5bc8d59
pkgrel=1
pkgdesc="Modern, high-performance MPD server written in pure Rust with DSD support and multi-room audio"
arch=('x86_64' 'aarch64')
url="https://github.com/M0Rf30/rmpd"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs' 'alsa-lib' 'sqlite')
makedepends=('rust' 'cargo' 'git')
optdepends=(
  'pulseaudio: PulseAudio output support'
  'pipewire: PipeWire output support'
  'snapcast: Multi-room audio synchronization'
)
provides=('rmpd')
conflicts=('rmpd')
source=("${pkgname}::git+https://github.com/M0Rf30/rmpd.git"
        "rmpd.service")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  export RUSTUP_TOOLCHAIN=stable

  # Use system SQLite instead of bundled
  sed -i 's/rusqlite = { version = "0.38", features = \["bundled"\] }/rusqlite = "0.38"/' Cargo.toml

  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --all-features
}

check() {
  cd "${srcdir}/${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --release --all-features
}

package() {
  cd "${srcdir}/${pkgname}"

  # Install binary
  install -Dm755 "target/release/rmpd" "${pkgdir}/usr/bin/rmpd"

  # Install example configuration
  install -Dm644 "rmpd.toml" "${pkgdir}/etc/rmpd/rmpd.toml.example"

  # Install licenses
  install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"

  # Install documentation
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "CI.md" "${pkgdir}/usr/share/doc/${pkgname}/CI.md"

  # Install systemd service file
  install -Dm644 "${srcdir}/rmpd.service" "${pkgdir}/usr/lib/systemd/user/rmpd.service"
}
