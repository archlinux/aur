# Maintainer: novica <nnovica@gmail.com>

pkgname=librepaper
pkgver=0.0.56 # renovate: datasource=github-releases depName=LibrePaper/librepaper
pkgrel=1
pkgdesc="A free collaborative writing, editing, and commenting platform"
url="https://github.com/LibrePaper/librepaper"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=(
    glibc
    libgcc
    gtk3
    webkit2gtk-4.1
    libsoup3
    glib2
    cairo
    pango
    harfbuzz
    gdk-pixbuf2
    at-spi2-core
    dbus
    hicolor-icon-theme
)
conflicts=('librepaper-bin')
makedepends=('rust' 'nodejs' 'bun' 'mold')
options=('!lto' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/LibrePaper/librepaper/archive/v${pkgver}.tar.gz")

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # Pinned wasm renderers, fonts and the CodeMirror binding, verified against their locks
    node tools/assets/pins.mjs fetch
    (cd web && bun install --frozen-lockfile)
    cargo fetch --locked
    cargo fetch --locked --manifest-path desktop/Cargo.toml
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export LIBREPAPER_VERSION="v${pkgver}"

  # The CLI embeds the built browser app
  (cd web && bun run build)
  cp README.md web/dist/README.md
  cargo build --release --locked -p librepaper --bin librepaper

  # tauri-build checks that the bundled CLI is in place
  local triple
  triple="$(rustc -vV | sed -n 's/^host: //p')"
  install -Dm755 target/release/librepaper "desktop/binaries/librepaper-${triple}"
  cargo build --release --locked --manifest-path desktop/Cargo.toml --features tauri/custom-protocol
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 target/release/librepaper "${pkgdir}/usr/bin/librepaper"
  install -Dm755 desktop/target/release/librepaper-desktop "${pkgdir}/usr/bin/librepaper-desktop"
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/librepaper.desktop" <<EOF
[Desktop Entry]
Categories=Office;
Exec=librepaper-desktop %u
StartupWMClass=librepaper-desktop
Icon=librepaper-desktop
Name=LibrePaper
Terminal=false
Type=Application
MimeType=x-scheme-handler/librepaper
EOF
  install -Dm644 desktop/icons/icon.png "${pkgdir}/usr/share/icons/hicolor/320x320/apps/librepaper-desktop.png"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('62a25b33e81dd56a095f17a5ef0c5a41b9ee88f7d260b6e24fa10b3fa54efec96ff3ab97cb0d8dd1c29539fefe0cdaf0f742486ada786c94de11307b333d1261')
