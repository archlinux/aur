# Maintainer: Carmine Paolino <carmine@paolino.me>
pkgname=chatwithwork-desktop
pkgver=0.9.0
pkgrel=1
pkgdesc="Chat with Work Desktop: the desktop app, terminal interface and background agent"
arch=('x86_64' 'aarch64')
url="https://github.com/crmne/chatwithwork-desktop"
license=('MIT OR Apache-2.0')
install="${pkgname}.install"
depends=('alsa-lib' 'libpipewire' 'glibc' 'gcc-libs' 'webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'dbus')
makedepends=('cargo' 'pkgconf' 'cmake' 'clang')
optdepends=('org.freedesktop.secrets: store the device key in your keyring'
            'xdg-desktop-portal: native folder picker'
            'sane: scan with a USB scanner'
            'tesseract: make scans searchable (with tesseract-data-<language>)'
            'systemd: start the agent now and at login with cww daemon install')
provides=('cww' 'cww-app')
conflicts=('cww' 'chatwithwork-desktop-bin' 'chatwithwork-desktop-git')
# !lto because ring compiles its own C and Arch's default CFLAGS put LTO
# objects in the archive, which the linker then cannot resolve. !debug
# because the release profile strips symbols, so a debug package would be
# empty.
options=('!debug' '!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/crmne/chatwithwork-desktop/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('92fa2bbd17c39502b49df958d11395fe068de07c058506d873a88c79cfa61339')

prepare() {
  cd "${srcdir}/chatwithwork-desktop-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/chatwithwork-desktop-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=${srcdir}=/"
  cargo build --frozen --release --workspace
}

check() {
  cd "${srcdir}/chatwithwork-desktop-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release --workspace
}

package() {
  cd "${srcdir}/chatwithwork-desktop-${pkgver}"
  install -Dm755 target/release/cww "${pkgdir}/usr/bin/cww"
  install -Dm755 target/release/cww-app "${pkgdir}/usr/bin/cww-app"
  install -Dm644 packaging/linux/cww-app.desktop "${pkgdir}/usr/share/applications/cww-app.desktop"
  install -Dm644 app/assets/mark.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/cww-app.svg"
  install -Dm644 packaging/systemd/cww.service "${pkgdir}/usr/lib/systemd/user/cww.service"
  install -Dm644 README.md PROTOCOL.md SECURITY.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 LICENSE-MIT LICENSE-APACHE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
