# Maintainer: HanHan666666 <tar.zip@outlook.com>
pkgname=linglong-store-bin
pkgver=3.2.0
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
  "linglong-store-3.2.0-linux-amd64.tar.gz::https://github.com/HanHan666666/flutter-linglong-store/releases/download/v3.2.0/linglong-store-3.2.0-linux-amd64.tar.gz"
  "linglong-store-3.2.0-linux-amd64.tar.gz.asc::https://github.com/HanHan666666/flutter-linglong-store/releases/download/v3.2.0/linglong-store-3.2.0-linux-amd64.tar.gz.asc"
)
source_aarch64=(
  "linglong-store-3.2.0-linux-arm64.tar.gz::https://github.com/HanHan666666/flutter-linglong-store/releases/download/v3.2.0/linglong-store-3.2.0-linux-arm64.tar.gz"
  "linglong-store-3.2.0-linux-arm64.tar.gz.asc::https://github.com/HanHan666666/flutter-linglong-store/releases/download/v3.2.0/linglong-store-3.2.0-linux-arm64.tar.gz.asc"
)

sha256sums=(
  'ab896bd5923d0e19e655588c98b7f38d7a4b937f6366a3410ae1cd5ecfd02340'
  '8192772970005ac886121c446e52e89fcdd22b71ed5cae5efa36131afac691f6'
  '8bb21e001733f7df099c3e3703d850e95f759ae9201a0957c2730c97af07aad3'
  'ca9c4e35c731cbf2fb4b1290e26af7fd0d2dc7bc8a89f6373e1334d27b19e60c'
)
sha256sums_x86_64=(
  '4e738aefbda9427c73ed5aa605d7915c6b7e8be08fc15f43137f2dbee5170a2a'
  'dd4369c43d55e9adba7beb1be83f65e0e8e79ef88e13f360a4d0be7d12cd3a27'
)
sha256sums_aarch64=(
  'a940810ba2075ca6de4d76c9feb7647454d7feb21281dfb5618a473c39b4d4d2'
  'e4abdfdb5e23eb6911c3e0ab9aefda4c1609dadfbcbe198b898e9fd4c2a452de'
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
