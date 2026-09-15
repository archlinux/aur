# Maintainer: Dawit Worku <dawitworkujima@gmail.com>
pkgname=omafil-git
pkgver=0.2.4
pkgrel=1
pkgdesc="File manager that follows your Omarchy theme"
arch=('x86_64')
url="https://github.com/dawitlabs/omafil"
license=('MIT')
# libarchive carries bsdtar, which extracts everything that is not a ZIP.
# glib2 carries gdbus, which formats a drive through UDisks2.
# wl-clipboard carries wl-copy and wl-paste, which move files to and from
# the desktop clipboard so copying works with other file managers.
depends=('webkit2gtk-4.1' 'gtk3' 'poppler' 'udisks2' 'xdg-utils' 'libnotify'
         'libarchive' 'glib2' 'wl-clipboard')
makedepends=('git' 'rust' 'bun-bin')
optdepends=('omarchy: theme and editor integration')
provides=('omafil')
# !debug: the release profile already sets strip = true, so makepkg's debug
# symbols are generated and then discarded.
# !lto: makepkg's global -flto breaks the C sources in zstd-sys, leaving
# undefined ZSTD_* symbols at link time. Cargo's own lto = true still applies.
options=('!debug' '!lto')
conflicts=('omafil')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/omafil"
  printf '%s.r%s.%s' \
    "$(sed -n 's/.*"version": "\([^"]*\)".*/\1/p' src-tauri/tauri.conf.json | head -1)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/omafil/src"
  bun install --frozen-lockfile
  bun run build

  # tauri.conf.json's beforeBuildCommand only runs under the tauri CLI, so the
  # frontend is built above and this is a plain cargo release build.
  # tauri/custom-protocol is what `cargo tauri build` passes to embed
  # frontendDist; without it the binary is a dev build that loads devUrl
  # (http://localhost:5173) and shows "Could not connect to localhost".
  cd "${srcdir}/omafil/src-tauri"
  cargo build --release --locked --features tauri/custom-protocol
}

package() {
  cd "${srcdir}/omafil"
  install -Dm755 src-tauri/target/release/omafil "${pkgdir}/usr/bin/omafil"
  install -Dm644 packaging/omafil.desktop "${pkgdir}/usr/share/applications/omafil.desktop"
  install -Dm644 src-tauri/icons/128x128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/omafil.png"
  install -Dm644 src-tauri/icons/32x32.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/omafil.png"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/omafil/README.md"
}
