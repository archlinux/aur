# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=opencode-desktop-bin
pkgver=1.14.19
pkgrel=1
pkgdesc="OpenCode desktop client"
arch=('x86_64' 'aarch64')
url="https://opencode.ai"
license=('MIT')
provides=('opencode-desktop' 'opencode')
conflicts=('opencode-desktop' 'opencode')
depends=('gtk3' 'webkit2gtk-4.1' 'hicolor-icon-theme' 'gst-plugins-good')
# Stripping breaks the bundled CLI payload and leaves a bare Bun runtime.
options=('!strip' '!debug')

latestver() {
  gh api --paginate repos/anomalyco/opencode/releases --jq '.[] | select(.prerelease == false and .draft == false and any(.assets[]; .name == "opencode-desktop-linux-amd64.deb") and any(.assets[]; .name == "opencode-desktop-linux-arm64.deb")) | .tag_name' |
    head -1 | sed -E 's/^v//'
}

source=("LICENSE::https://raw.githubusercontent.com/anomalyco/opencode/v${pkgver}/LICENSE")
source_x86_64=("opencode-desktop-${pkgver}-linux-amd64.deb::https://github.com/anomalyco/opencode/releases/download/v${pkgver}/opencode-desktop-linux-amd64.deb")
source_aarch64=("opencode-desktop-${pkgver}-linux-arm64.deb::https://github.com/anomalyco/opencode/releases/download/v${pkgver}/opencode-desktop-linux-arm64.deb")
sha256sums=('625f0f619133f89bbbb2abe37369613dfa1885eba1e50d02170deb62bb42cb6b')
sha256sums_x86_64=('884f2bf00bfb2e84a331cb3c7ce92b2bf3b6c5d98d716b0c50160b83f78914e7')
sha256sums_aarch64=('931caf39c9b2fef2a9bff8d8d96f884e1a32d510a6a75b21f793ee3502e5bc3c')

package() {
  local debfile
  case "$CARCH" in
    x86_64) debfile="opencode-desktop-${pkgver}-linux-amd64.deb" ;;
    aarch64) debfile="opencode-desktop-${pkgver}-linux-arm64.deb" ;;
  esac

  bsdtar -xf "${srcdir}/${debfile}" -C "${srcdir}" data.tar.gz control.tar.gz
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"

  # Rename binaries
  mv "${pkgdir}/usr/bin/OpenCode" "${pkgdir}/usr/bin/opencode-desktop"
  mv "${pkgdir}/usr/bin/opencode-cli" "${pkgdir}/usr/bin/opencode"
  # Sidecar symlink: Tauri GUI resolves sidecar as "opencode-cli" next to itself
  ln -s opencode "${pkgdir}/usr/bin/opencode-cli"

  # Patch desktop file
  sed -i 's|Exec=OpenCode|Exec=opencode-desktop|' "${pkgdir}/usr/share/applications/OpenCode.desktop"

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
