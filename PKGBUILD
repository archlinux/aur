# Maintainer: Carmine Paolino <carmine@paolino.me>
pkgname=chatwithwork-desktop-git
pkgver=0.9.1
pkgrel=1
pkgdesc="Chat with Work Desktop: the desktop app, terminal interface and background agent (development version)"
arch=('x86_64' 'aarch64')
url="https://github.com/crmne/chatwithwork-desktop"
license=('MIT OR Apache-2.0')
install="${pkgname}.install"
depends=('alsa-lib' 'libpipewire' 'glibc' 'gcc-libs' 'webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'dbus')
makedepends=('git' 'cargo' 'pkgconf' 'cmake' 'clang')
optdepends=('org.freedesktop.secrets: store the device key in your keyring'
            'xdg-desktop-portal: native folder picker'
            'sane: scan with a USB scanner'
            'tesseract: make scans searchable (with tesseract-data-<language>)'
            'systemd: start the agent now and at login with cww daemon install')
provides=('cww' 'cww-app' 'chatwithwork-desktop')
conflicts=('cww' 'chatwithwork-desktop' 'chatwithwork-desktop-bin')
options=('!debug' '!lto')
source=("${pkgname}::git+https://github.com/crmne/chatwithwork-desktop.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags --match 'v[0-9]*' --abbrev=7 | sed 's/^v//;s/\-/.r/;s/\-g/./'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=${srcdir}=/"
  cargo build --frozen --release --workspace
}

check() {
  cd "${srcdir}/${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release --workspace
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 target/release/cww "${pkgdir}/usr/bin/cww"
  install -Dm755 target/release/cww-app "${pkgdir}/usr/bin/cww-app"
  install -Dm644 packaging/linux/cww-app.desktop "${pkgdir}/usr/share/applications/cww-app.desktop"
  install -Dm644 app/assets/mark.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/cww-app.svg"
  install -Dm644 packaging/systemd/cww.service "${pkgdir}/usr/lib/systemd/user/cww.service"
  install -Dm644 README.md PROTOCOL.md SECURITY.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 LICENSE-MIT LICENSE-APACHE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
