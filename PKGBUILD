# Maintainer: Yasen Pavlov <yasen.pavlov+aur@bitnet.me>
#
# Source package: builds Manifold from the tagged release. The pkgver +
# sha256sums are bumped automatically by .github/workflows/aur-publish.yml when a
# GitHub release is published. Named manifold-steam (NOT manifold) to avoid the
# extra/manifold geometry library.
pkgname=manifold-steam
pkgver=0.3.0
pkgrel=1
pkgdesc="Bulk-manage Steam launch options and Proton compatibility"
arch=('x86_64')
url="https://github.com/yasen-pavlov/manifold"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
makedepends=('rust' 'cargo' 'nodejs' 'npm')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b92618948de4dc879642201305108928395cb196dc02c00e2252da362948a86e')

build() {
  cd "manifold-${pkgver}"
  npm ci
  # Build the binary only (the .desktop + icons are installed below); skips the
  # deb/AppImage bundlers and their tooling.
  node_modules/.bin/tauri build --no-bundle
}

package() {
  cd "manifold-${pkgver}"

  install -Dm755 "src-tauri/target/release/manifold" "${pkgdir}/usr/bin/manifold"

  # The .desktop is named to match the runtime Wayland app_id (`manifold`, the
  # binary name) so the running window associates its entry/icon. Written here
  # rather than via Tauri, which emits Manifold.desktop (capitalised, mismatching
  # the app_id), sparse rasters only, and no Keywords.
  install -dm755 "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/manifold.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=Manifold
Comment=Bulk-manage Steam launch options and Proton compatibility
Exec=manifold
Icon=manifold
Terminal=false
Categories=Utility;
Keywords=Steam;Proton;Launch;Compatibility;Gaming;
StartupWMClass=manifold
DESKTOP

  install -Dm644 "src-tauri/icons/32x32.png"   "${pkgdir}/usr/share/icons/hicolor/32x32/apps/manifold.png"
  install -Dm644 "src-tauri/icons/128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/manifold.png"
  # Tauri emits only sparse rasters; ship the source SVG as a scalable icon so
  # launchers that don't size-fallback across rasters (Qt / Quickshell) find it.
  install -Dm644 "public/manifold.svg"         "${pkgdir}/usr/share/icons/hicolor/scalable/apps/manifold.svg"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
