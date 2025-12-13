# Maintainer: Anton Afanasyev <aasoft+aur@pm.me>

pkgname=ringboard
pkgver=0.13.1
pkgrel=1
pkgdesc='Fast, efficient, and composable clipboard manager for Linux'
arch=('x86_64')
url='https://github.com/SUPERCILEX/clipboard-history'
license=('Apache-2.0' 'AGPL-3.0-only')
depends=('libglvnd' 'libx11' 'libxcursor' 'libxi' 'libxkbcommon' 'wayland')
makedepends=('rustup')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SUPERCILEX/clipboard-history/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2f6a751e43a1bc09f82306ae2527ec01e092ed76a416ee5a65bca59065ddd6bd')

prepare() {
  cd "clipboard-history-${pkgver}"

  # Ringboard uses nightly-only Rust features.
  rustup toolchain install nightly --profile minimal --no-self-update
}

build() {
  cd "clipboard-history-${pkgver}"

  export CARGO_HOME="${srcdir}/cargo-home"
  export CARGO_TARGET_DIR="${srcdir}/target"
  export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix=${srcdir}=."

  rustup run nightly cargo build --release --locked --workspace --bins
}

package() {
  cd "clipboard-history-${pkgver}"

  install -Dm755 "${srcdir}/target/release/ringboard" "${pkgdir}/usr/bin/ringboard"
  install -Dm755 "${srcdir}/target/release/ringboard-server" "${pkgdir}/usr/bin/ringboard-server"
  install -Dm755 "${srcdir}/target/release/ringboard-x11" "${pkgdir}/usr/bin/ringboard-x11"
  install -Dm755 "${srcdir}/target/release/ringboard-wayland" "${pkgdir}/usr/bin/ringboard-wayland"
  install -Dm755 "${srcdir}/target/release/ringboard-egui" "${pkgdir}/usr/bin/ringboard-egui"
  install -Dm755 "${srcdir}/target/release/ringboard-tui" "${pkgdir}/usr/bin/ringboard-tui"
  install -Dm755 "${srcdir}/target/release/wayland-interface-check" "${pkgdir}/usr/bin/wayland-interface-check"

  install -Dm644 server/ringboard-server.service "${pkgdir}/usr/lib/systemd/user/ringboard-server.service"
  install -Dm644 x11/ringboard-x11.service "${pkgdir}/usr/lib/systemd/user/ringboard-x11.service"
  install -Dm644 wayland/ringboard-wayland.service "${pkgdir}/usr/lib/systemd/user/ringboard-wayland.service"
  install -Dm644 ringboard.slice "${pkgdir}/usr/lib/systemd/user/ringboard.slice"

  install -Dm644 egui/ringboard-egui.desktop "${pkgdir}/usr/share/applications/ringboard.desktop"
  install -Dm644 logo.jpeg "${pkgdir}/usr/share/pixmaps/ringboard.jpeg"

  # Drop the xdg-open shebang to avoid a hard dependency on xdg-utils.
  sed -i '1{/^#!\/usr\/bin\/env xdg-open$/d}' "${pkgdir}/usr/share/applications/ringboard.desktop"

  # Prefer the toggle UX and a deterministic icon path.
  sed -i 's|^Exec=ringboard-egui$|Exec=ringboard-egui toggle|' "${pkgdir}/usr/share/applications/ringboard.desktop"
  sed -i 's|^Icon=ringboard$|Icon=/usr/share/pixmaps/ringboard.jpeg|' "${pkgdir}/usr/share/applications/ringboard.desktop"

  install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
  install -Dm644 server/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-AGPL-3.0"
}
