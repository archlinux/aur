# Maintainer: HanHan666666 <tar.zip@outlook.com>
pkgname=linglong-store-nightly-bin
pkgver=3.5.0_nightly.20260821.d5c072f
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
  "linglong-store-3.5.0-nightly.20260821+d5c072f-linux-amd64.tar.gz::https://github.com/HanHan666666/flutter-linglong-store/releases/download/nightly-20260821/linglong-store-3.5.0-nightly.20260821+d5c072f-linux-amd64.tar.gz"
  "linglong-store-3.5.0-nightly.20260821+d5c072f-linux-amd64.tar.gz.asc::https://github.com/HanHan666666/flutter-linglong-store/releases/download/nightly-20260821/linglong-store-3.5.0-nightly.20260821+d5c072f-linux-amd64.tar.gz.asc"
)
source_aarch64=(
  "linglong-store-3.5.0-nightly.20260821+d5c072f-linux-arm64.tar.gz::https://github.com/HanHan666666/flutter-linglong-store/releases/download/nightly-20260821/linglong-store-3.5.0-nightly.20260821+d5c072f-linux-arm64.tar.gz"
  "linglong-store-3.5.0-nightly.20260821+d5c072f-linux-arm64.tar.gz.asc::https://github.com/HanHan666666/flutter-linglong-store/releases/download/nightly-20260821/linglong-store-3.5.0-nightly.20260821+d5c072f-linux-arm64.tar.gz.asc"
)

sha256sums=(
  'ab896bd5923d0e19e655588c98b7f38d7a4b937f6366a3410ae1cd5ecfd02340'
  '1669297d48b356f338764ac248168da9048d9e4612a9a8bc9481a496b6fab680'
  '720f2d130477162ea9338eaa5f77bf75a1d9421fdfbb5321e647a804f5a2a0c1'
  '6f913a600eff6de52a8c2d64f62a3cceb1196635686db378c5a339080159676d'
  'ca9c4e35c731cbf2fb4b1290e26af7fd0d2dc7bc8a89f6373e1334d27b19e60c'
)
sha256sums_x86_64=(
  '094dce58570268049e7bd5e55b67dc7d15b0ed22bfc1760221924430d575f4c3'
  'af0521c758cf05dbe549880f1b7c83ca94de409828a23e12b0bf9369a5e2ba77'
)
sha256sums_aarch64=(
  '95be72e992856963f717895f44120982d569e13296352610308df1b2db7461a0'
  'd7995c1e1d763f24c600303b56eaa0ef1959d8b12b25752e8e247304be3d2103'
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
