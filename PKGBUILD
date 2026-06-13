# Maintainer: HanHan666666 <tar.zip@outlook.com>
pkgname=linglong-store-bin
pkgver=3.4.0
pkgrel=1
pkgdesc="Community store for browsing and installing Linyaps applications"
arch=('x86_64' 'aarch64')
url="https://github.com/HanHan666666/flutter-linglong-store"
license=('MIT')
depends=(
  'atk'
  'bash'
  'cairo'
  'fontconfig'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'libstdc++'
  'hicolor-icon-theme'
  'libepoxy'
  'pango'
  'linyaps'
)
provides=('linglong-store')
conflicts=('linglong-store')
changelog=linglong-store-bin.changelog

# PGP signature verification
validpgpkeys=('904563A5988A3116525C2F0E6E57D5E09AA3F841')

source=(
  'LICENSE'
  'linglong-store.desktop'
  'linglong-store.metainfo.xml'
  'linglong-store.svg'
)
source_x86_64=(
  "linglong-store-3.4.0-linux-amd64.tar.gz::https://github.com/HanHan666666/flutter-linglong-store/releases/download/v3.4.0/linglong-store-3.4.0-linux-amd64.tar.gz"
  "linglong-store-3.4.0-linux-amd64.tar.gz.asc::https://github.com/HanHan666666/flutter-linglong-store/releases/download/v3.4.0/linglong-store-3.4.0-linux-amd64.tar.gz.asc"
)
source_aarch64=(
  "linglong-store-3.4.0-linux-arm64.tar.gz::https://github.com/HanHan666666/flutter-linglong-store/releases/download/v3.4.0/linglong-store-3.4.0-linux-arm64.tar.gz"
  "linglong-store-3.4.0-linux-arm64.tar.gz.asc::https://github.com/HanHan666666/flutter-linglong-store/releases/download/v3.4.0/linglong-store-3.4.0-linux-arm64.tar.gz.asc"
)

sha256sums=(
  'ab896bd5923d0e19e655588c98b7f38d7a4b937f6366a3410ae1cd5ecfd02340'
  '7d14b8e724cd7979b68834f6bb28eac6b0f9555c655771d0fbec0269e676bd2c'
  'cd5f0a6d7cacfda7747969d56a04001d816da614673ef1270c837cad925463f7'
  'ca9c4e35c731cbf2fb4b1290e26af7fd0d2dc7bc8a89f6373e1334d27b19e60c'
)
sha256sums_x86_64=(
  '5049281f511645c31bc7cbe78d321c724f2f1a43cc3227ff8df3b7bab953e709'
  '730b64d5c7e9b970100c94c7bee8df1896fb84c2d576880b2353a83ab1e11885'
)
sha256sums_aarch64=(
  'f88572fb0808b3f40e5a496a08e3830f74b346ff69de47ce36720f9f2c84f6c6'
  'ca5a0ce21b18d650ed7fe46dba9f8d666557494153956c6128cb700f5fae6c39'
)

package() {
  # Install application files
  install -dm755 "${pkgdir}/opt/linglong-store"
  cp -a "${srcdir}/linglong-store/." "${pkgdir}/opt/linglong-store/"

  # Install launcher script
  install -dm755 "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/linglong-store" <<'LAUNCHER'
#!/usr/bin/bash
set -euo pipefail
exec /opt/linglong-store/linglong_store "$@"
LAUNCHER
  chmod 755 "${pkgdir}/usr/bin/linglong-store"

  # Install desktop metadata from tracked AUR sources so package metadata
  # does not depend on optional files inside the release tarball.
  install -Dm644 "${srcdir}/linglong-store.desktop" "${pkgdir}/usr/share/applications/linglong-store.desktop"

  # Validate desktop file if tool available
  if command -v desktop-file-validate &>/dev/null; then
    desktop-file-validate "${pkgdir}/usr/share/applications/linglong-store.desktop" || true
  fi

  # Install icon
  install -Dm644 "${srcdir}/linglong-store.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/linglong-store.svg"

  # Install metainfo
  install -Dm644 "${srcdir}/linglong-store.metainfo.xml" "${pkgdir}/usr/share/metainfo/linglong-store.metainfo.xml"

  # Install LICENSE
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
