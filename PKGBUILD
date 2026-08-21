# Maintainer: HanHan666666 <tar.zip@outlook.com>
pkgname=linglong-store-bin
pkgver=3.6.0
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
  'com.dongpl.linglong-store.v2.desktop'
  'linglong-store.desktop'
  'linglong-store.metainfo.xml'
  'linglong-store.svg'
)
source_x86_64=(
  "linglong-store-3.6.0-linux-amd64.tar.gz::https://github.com/HanHan666666/flutter-linglong-store/releases/download/v3.6.0/linglong-store-3.6.0-linux-amd64.tar.gz"
  "linglong-store-3.6.0-linux-amd64.tar.gz.asc::https://github.com/HanHan666666/flutter-linglong-store/releases/download/v3.6.0/linglong-store-3.6.0-linux-amd64.tar.gz.asc"
)
source_aarch64=(
  "linglong-store-3.6.0-linux-arm64.tar.gz::https://github.com/HanHan666666/flutter-linglong-store/releases/download/v3.6.0/linglong-store-3.6.0-linux-arm64.tar.gz"
  "linglong-store-3.6.0-linux-arm64.tar.gz.asc::https://github.com/HanHan666666/flutter-linglong-store/releases/download/v3.6.0/linglong-store-3.6.0-linux-arm64.tar.gz.asc"
)

sha256sums=(
  'ab896bd5923d0e19e655588c98b7f38d7a4b937f6366a3410ae1cd5ecfd02340'
  'f306e8a052f96a6e2a7aa53201fff17a848ef63ca605014e24a0b0fa34e967dd'
  '0de17d7ea78ee5c8ea91425034349a121286e9805cf4b9d903f70910050fbe24'
  '07c7da2013e802be1d670dcaf269bb54973c9840c8e7448ec857109f9e7da7bc'
  'ca9c4e35c731cbf2fb4b1290e26af7fd0d2dc7bc8a89f6373e1334d27b19e60c'
)
sha256sums_x86_64=(
  'a1b0e8b1c8e4ba6f7df9739a4ffd7ece1f0305c3c6f33973118f52f436b9c903'
  '276402af148e22a034f3b208dfb9a9a991474bdbb4fdd9b8af3ee7e7b0fbc50a'
)
sha256sums_aarch64=(
  '476ebaf785ecc8cf70706bb5897d0daf75905cf9206a60d1d2769087a5305500'
  '3c58a8a258d0edbbe182d58f40866f774443bc51ad09adfd9a2b76e13f9cd987'
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
  install -Dm644 "${srcdir}/linglong-store.desktop" "${pkgdir}/usr/share/applications/linglong-store.desktop"

  # Validate desktop file if tool available
  if command -v desktop-file-validate &>/dev/null; then
    desktop-file-validate "${pkgdir}/usr/share/applications/com.dongpl.linglong-store.v2.desktop" || true
    desktop-file-validate "${pkgdir}/usr/share/applications/linglong-store.desktop" || true
  fi

  # Install icon
  install -Dm644 "${srcdir}/linglong-store.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/linglong-store.svg"

  # Install metainfo
  install -Dm644 "${srcdir}/linglong-store.metainfo.xml" "${pkgdir}/usr/share/metainfo/linglong-store.metainfo.xml"

  # Install LICENSE
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
