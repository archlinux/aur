# Maintainer: HanHan666666 <tar.zip@outlook.com>
pkgname=linglong-store-nightly-bin
pkgver=3.6.0_nightly.20260920.23d2597
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
conflicts=('linglong-store' 'linglong-store-bin')
changelog=linglong-store-nightly-bin.changelog

# PGP signature verification
validpgpkeys=('904563A5988A3116525C2F0E6E57D5E09AA3F841')

source=(
  'LICENSE'
  'com.dongpl.linglong-store.v2.desktop'
  'linglong-store-nightly.desktop'
  'linglong-store.metainfo.xml'
  'linglong-store.svg'
)
source_x86_64=(
  "linglong-store-3.6.0-nightly.20260920+23d2597-linux-amd64.tar.gz::https://github.com/HanHan666666/flutter-linglong-store/releases/download/nightly-20260920/linglong-store-3.6.0-nightly.20260920+23d2597-linux-amd64.tar.gz"
  "linglong-store-3.6.0-nightly.20260920+23d2597-linux-amd64.tar.gz.asc::https://github.com/HanHan666666/flutter-linglong-store/releases/download/nightly-20260920/linglong-store-3.6.0-nightly.20260920+23d2597-linux-amd64.tar.gz.asc"
)
source_aarch64=(
  "linglong-store-3.6.0-nightly.20260920+23d2597-linux-arm64.tar.gz::https://github.com/HanHan666666/flutter-linglong-store/releases/download/nightly-20260920/linglong-store-3.6.0-nightly.20260920+23d2597-linux-arm64.tar.gz"
  "linglong-store-3.6.0-nightly.20260920+23d2597-linux-arm64.tar.gz.asc::https://github.com/HanHan666666/flutter-linglong-store/releases/download/nightly-20260920/linglong-store-3.6.0-nightly.20260920+23d2597-linux-arm64.tar.gz.asc"
)

sha256sums=(
  'ab896bd5923d0e19e655588c98b7f38d7a4b937f6366a3410ae1cd5ecfd02340'
  'b0637b596a61e36d264cf85ef24ef5a2f20c2a00d6dd9fdc87f7512ed4551dc2'
  'fb968d9ceab0c17aa429ae79142f05522d202918a500a1d72edf20989f588c90'
  '645c080d2c83e1cfcede15bd12644740a69fdff94aac5c3a092536c2055da1a7'
  'ca9c4e35c731cbf2fb4b1290e26af7fd0d2dc7bc8a89f6373e1334d27b19e60c'
)
sha256sums_x86_64=(
  'd1e6c48512144782c170ed59483a085b74de927fe06b931ad19182936b3853be'
  'cfad62ba16bf5fa34ce9ebe9517e2e1688cc8c1cc3496195b6046c27ce62d8ef'
)
sha256sums_aarch64=(
  '2afaf2f2cd77156d6a04224706c996e3873f888a1a70b31b334a69ab17c3b22b'
  'd303d76fd2aaec27cf2f0cd14c6b184cd8da37795e4b4a73b8e2c80008518c8e'
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
  install -Dm644 "${srcdir}/com.dongpl.linglong-store.v2.desktop" "${pkgdir}/usr/share/applications/com.dongpl.linglong-store.v2.desktop"
  install -Dm644 "${srcdir}/linglong-store-nightly.desktop" "${pkgdir}/usr/share/applications/linglong-store-nightly.desktop"

  # Validate desktop file if tool available
  if command -v desktop-file-validate &>/dev/null; then
    desktop-file-validate "${pkgdir}/usr/share/applications/com.dongpl.linglong-store.v2.desktop" || true
    desktop-file-validate "${pkgdir}/usr/share/applications/linglong-store-nightly.desktop" || true
  fi

  # Install icon
  install -Dm644 "${srcdir}/linglong-store.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/linglong-store.svg"

  # Install metainfo
  install -Dm644 "${srcdir}/linglong-store.metainfo.xml" "${pkgdir}/usr/share/metainfo/linglong-store.metainfo.xml"

  # Install LICENSE
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
