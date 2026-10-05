# Maintainer: Carmine Paolino <carmine@paolino.me>
pkgname=chatwithwork-local-agent
pkgver=0.3.0
pkgrel=1
pkgdesc="Chat with Work: desktop app, terminal interface and local background agent"
arch=('x86_64' 'aarch64')
url="https://github.com/crmne/chatwithwork-local-agent"
license=('MIT OR Apache-2.0')
install="${pkgname}.install"
depends=('glibc' 'gcc-libs' 'libglvnd' 'libx11' 'libxcursor' 'libxi' 'libxrandr' 'libxkbcommon' 'libxkbcommon-x11' 'wayland')
makedepends=('cargo')
optdepends=('org.freedesktop.secrets: store the device key in your keyring'
            'xdg-desktop-portal: native folder picker'
            'systemd: start the agent now and at login with cww daemon install')
provides=('cww' 'cww-app')
conflicts=('cww' 'chatwithwork-local-agent-bin' 'chatwithwork-local-agent-git')
# !lto because ring compiles its own C and Arch's default CFLAGS put LTO
# objects in the archive, which the linker then cannot resolve. !debug
# because the release profile strips symbols, so a debug package would be
# empty.
options=('!debug' '!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/crmne/chatwithwork-local-agent/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('00636f8491a1867c003c22e42bfe43bb690989033646dc64cf455f5466207460')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=${srcdir}=/"
  cargo build --frozen --release --workspace
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release --workspace
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 target/release/cww "${pkgdir}/usr/bin/cww"
  install -Dm755 target/release/cww-app "${pkgdir}/usr/bin/cww-app"
  install -Dm644 packaging/linux/cww-app.desktop "${pkgdir}/usr/share/applications/cww-app.desktop"
  install -Dm644 app/assets/mark.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/cww-app.svg"
  install -Dm644 packaging/systemd/cww.service "${pkgdir}/usr/lib/systemd/user/cww.service"
  install -Dm644 README.md PROTOCOL.md SECURITY.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 LICENSE-MIT LICENSE-APACHE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
