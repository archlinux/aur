# Maintainer: HanHan666666 <tar.zip@outlook.com>
pkgname=linglong-store-nightly-bin
pkgver=3.6.0_nightly.20261004.74ef018
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
  "linglong-store-3.6.0-nightly.20261004+74ef018-linux-amd64.tar.gz::https://github.com/HanHan666666/flutter-linglong-store/releases/download/nightly-202610/linglong-store-3.6.0-nightly.20261004+74ef018-linux-amd64.tar.gz"
  "linglong-store-3.6.0-nightly.20261004+74ef018-linux-amd64.tar.gz.asc::https://github.com/HanHan666666/flutter-linglong-store/releases/download/nightly-202610/linglong-store-3.6.0-nightly.20261004+74ef018-linux-amd64.tar.gz.asc"
)
source_aarch64=(
  "linglong-store-3.6.0-nightly.20261004+74ef018-linux-arm64.tar.gz::https://github.com/HanHan666666/flutter-linglong-store/releases/download/nightly-202610/linglong-store-3.6.0-nightly.20261004+74ef018-linux-arm64.tar.gz"
  "linglong-store-3.6.0-nightly.20261004+74ef018-linux-arm64.tar.gz.asc::https://github.com/HanHan666666/flutter-linglong-store/releases/download/nightly-202610/linglong-store-3.6.0-nightly.20261004+74ef018-linux-arm64.tar.gz.asc"
)

sha256sums=(
  'ab896bd5923d0e19e655588c98b7f38d7a4b937f6366a3410ae1cd5ecfd02340'
  'b0637b596a61e36d264cf85ef24ef5a2f20c2a00d6dd9fdc87f7512ed4551dc2'
  'fb968d9ceab0c17aa429ae79142f05522d202918a500a1d72edf20989f588c90'
  '645c080d2c83e1cfcede15bd12644740a69fdff94aac5c3a092536c2055da1a7'
  'ca9c4e35c731cbf2fb4b1290e26af7fd0d2dc7bc8a89f6373e1334d27b19e60c'
)
sha256sums_x86_64=(
  'a7af3443a4487bc4153c3172c0d8531e9ba509396519acc3a4c3f34f27df6ce9'
  'de1f999261511b1e372741684d8eee88aaad013c34ed80940acd98fd504aa477'
)
sha256sums_aarch64=(
  '56e6d45e392b5d545266560be0ead982e6c7d28a3ee0fa62c3b02d6d61e02a53'
  '5c008f574b33881633a878cc50fee29dedd2dbd22d6826613d6c023d5a72caed'
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
