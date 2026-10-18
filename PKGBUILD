# Maintainer: AngelSherry
pkgname=cosmic-ext-applet-clippy-land
pkgver=1.1.1
pkgrel=1
pkgdesc='Clipboard history applet for the COSMIC panel'
arch=('x86_64')
url='https://github.com/k33wee/clippy-land'
license=('GPL-3.0-or-later')
depends=('cosmic-panel' 'cosmic-icon-theme' 'fontconfig' 'glibc' 'libgcc'
         'libglvnd' 'libxkbcommon' 'wayland')
makedepends=('cargo' 'cmake' 'git' 'pkgconf')
conflicts=('cosmic-ext-applet-clippy-land-git')
source=("clippy-land-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('db6df81a12712d0e4fbcddddb0d10bf65822c30828c6e6b7eb1a015e8be78b6e')

prepare() {
  cd "clippy-land-${pkgver}"
  # Cargo.lock pins the Git dependencies too; Git here does not make this a VCS package.
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd "clippy-land-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

check() {
  cd "clippy-land-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Upstream's live-Wayland tests and manual benchmark stay ignored.
  cargo test --release --frozen -- --test-threads=1
}

package() {
  cd "clippy-land-${pkgver}"
  local appid=io.github.k33wee.clippy-land
  local binary=cosmic-applet-clippy-land

  install -Dm755 "target/release/${binary}" "${pkgdir}/usr/bin/${binary}"
  # The other upstream .sh launcher targets /app/bin and is Flatpak-only.
  sh scripts/render-debug-wrapper.sh "resources/${binary}-debug.sh.in" \
    "/usr/bin/${binary}" "${pkgdir}/usr/bin/${binary}-debug.sh"
  # Do not embed $pkgdir in Exec= via `just prefix=... install`.
  sh scripts/render-desktop-entry.sh "resources/${appid}.desktop" \
    "/usr/bin/${binary}" "${pkgdir}/usr/share/applications/${appid}.desktop"
  chmod 644 "${pkgdir}/usr/share/applications/${appid}.desktop"
  install -Dm644 "resources/${appid}.metainfo.xml" \
    "${pkgdir}/usr/share/metainfo/${appid}.metainfo.xml"
  install -Dm644 resources/icon.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${appid}.svg"
  install -Dm644 resources/icon.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${appid}-symbolic.svg"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
