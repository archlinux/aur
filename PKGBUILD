# Maintainer: HanHan666666 <tar.zip@outlook.com>
pkgname=linglong-store-nightly-bin
pkgver=3.5.0_nightly.20260801.aaec5be
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
  "linglong-store-3.5.0-nightly.20260801+aaec5be-linux-amd64.tar.gz::https://github.com/HanHan666666/flutter-linglong-store/releases/download/nightly-20260801/linglong-store-3.5.0-nightly.20260801+aaec5be-linux-amd64.tar.gz"
  "linglong-store-3.5.0-nightly.20260801+aaec5be-linux-amd64.tar.gz.asc::https://github.com/HanHan666666/flutter-linglong-store/releases/download/nightly-20260801/linglong-store-3.5.0-nightly.20260801+aaec5be-linux-amd64.tar.gz.asc"
)
source_aarch64=(
  "linglong-store-3.5.0-nightly.20260801+aaec5be-linux-arm64.tar.gz::https://github.com/HanHan666666/flutter-linglong-store/releases/download/nightly-20260801/linglong-store-3.5.0-nightly.20260801+aaec5be-linux-arm64.tar.gz"
  "linglong-store-3.5.0-nightly.20260801+aaec5be-linux-arm64.tar.gz.asc::https://github.com/HanHan666666/flutter-linglong-store/releases/download/nightly-20260801/linglong-store-3.5.0-nightly.20260801+aaec5be-linux-arm64.tar.gz.asc"
)

sha256sums=(
  'ab896bd5923d0e19e655588c98b7f38d7a4b937f6366a3410ae1cd5ecfd02340'
  '6fa325c2e8d1e8af2e91950d13d723b2aa455b24af0b8d6896b8bac95d018e83'
  '248dd96c57655205daa3a999fc8703c573b2887c171e2267b229c76eb1ad27d1'
  '88679739b8368879fc6be9b22f708e1c57f20bcd41a4f5f0673e81f355c5879e'
  'ca9c4e35c731cbf2fb4b1290e26af7fd0d2dc7bc8a89f6373e1334d27b19e60c'
)
sha256sums_x86_64=(
  'a649dc61c8c636777176bf915ac081388b2c5977f64da9506226b07873fdab49'
  '63e751fca0c6144f2ed8e23f63397c96097edfdc057c5c519630c70274c606f6'
)
sha256sums_aarch64=(
  'f2b75c9c9c8e17c1794e7b9b4b0eb22577c4da136118c20a9fd2f0d115158c8b'
  '4970a0331e2154e293d3e31e3e3e8789775541bfa99dde964a9c07e26de2f4fd'
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
