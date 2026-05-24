# Maintainer: HanHan666666 <tar.zip@outlook.com>
pkgname=linglong-store-nightly-bin
pkgver=3.3.6_nightly.20260524.c19ec2a
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
  'linglong-store-nightly.desktop'
  'linglong-store.metainfo.xml'
  'linglong-store.svg'
)
source_x86_64=(
  "linglong-store-3.3.6-nightly.20260524+c19ec2a-linux-amd64.tar.gz::https://github.com/HanHan666666/flutter-linglong-store/releases/download/nightly-20260524/linglong-store-3.3.6-nightly.20260524+c19ec2a-linux-amd64.tar.gz"
  "linglong-store-3.3.6-nightly.20260524+c19ec2a-linux-amd64.tar.gz.asc::https://github.com/HanHan666666/flutter-linglong-store/releases/download/nightly-20260524/linglong-store-3.3.6-nightly.20260524+c19ec2a-linux-amd64.tar.gz.asc"
)
source_aarch64=(
  "linglong-store-3.3.6-nightly.20260524+c19ec2a-linux-arm64.tar.gz::https://github.com/HanHan666666/flutter-linglong-store/releases/download/nightly-20260524/linglong-store-3.3.6-nightly.20260524+c19ec2a-linux-arm64.tar.gz"
  "linglong-store-3.3.6-nightly.20260524+c19ec2a-linux-arm64.tar.gz.asc::https://github.com/HanHan666666/flutter-linglong-store/releases/download/nightly-20260524/linglong-store-3.3.6-nightly.20260524+c19ec2a-linux-arm64.tar.gz.asc"
)

sha256sums=(
  'ab896bd5923d0e19e655588c98b7f38d7a4b937f6366a3410ae1cd5ecfd02340'
  'eee7fda5316ed06b3096c40cc7baf95ec41d0a952ddf22ac6e3057b40f23b714'
  '2cca493a43459883f3dcf8530e263782c62f0b165da296f6f42c455f2b575848'
  'ca9c4e35c731cbf2fb4b1290e26af7fd0d2dc7bc8a89f6373e1334d27b19e60c'
)
sha256sums_x86_64=(
  'cc2e5c0479fe1743a6d439e00a2b089933eebf022bab23f9a61825ca53fd5d95'
  'dbd01447943e5b221fd5f6d1aead0f102bc94fefb18fa3228cfd9142c1a86c79'
)
sha256sums_aarch64=(
  '3766f5bc039ceb09a999b65026c709354d26bf8851e2b23439c3c9110ff3c71e'
  'a68882fcd38f359f8447d07121a6d6417fa28811a3e927d60fa324ed36a3b269'
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
  install -Dm644 "${srcdir}/linglong-store-nightly.desktop" "${pkgdir}/usr/share/applications/linglong-store-nightly.desktop"

  # Validate desktop file if tool available
  if command -v desktop-file-validate &>/dev/null; then
    desktop-file-validate "${pkgdir}/usr/share/applications/linglong-store-nightly.desktop" || true
  fi

  # Install icon
  install -Dm644 "${srcdir}/linglong-store.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/linglong-store.svg"

  # Install metainfo
  install -Dm644 "${srcdir}/linglong-store.metainfo.xml" "${pkgdir}/usr/share/metainfo/linglong-store.metainfo.xml"

  # Install LICENSE
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
