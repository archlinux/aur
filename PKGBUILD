# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=opencode-desktop-bin
pkgver=1.2.27
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
  curl -fsSL 'https://api.github.com/repos/anomalyco/opencode/releases/latest' | jq -r 'select(any(.assets[]?; .name == "opencode-desktop-linux-amd64.deb") and any(.assets[]?; .name == "opencode-desktop-linux-arm64.deb")) | .tag_name' |
    sed -E 's/^v//'
}

source=("LICENSE::https://raw.githubusercontent.com/anomalyco/opencode/v${pkgver}/LICENSE")
source_x86_64=("opencode-desktop-${pkgver}-linux-amd64.deb::https://github.com/anomalyco/opencode/releases/download/v${pkgver}/opencode-desktop-linux-amd64.deb")
source_aarch64=("opencode-desktop-${pkgver}-linux-arm64.deb::https://github.com/anomalyco/opencode/releases/download/v${pkgver}/opencode-desktop-linux-arm64.deb")
sha256sums=('625f0f619133f89bbbb2abe37369613dfa1885eba1e50d02170deb62bb42cb6b')
sha256sums_x86_64=('0de9fc43323e05d5a5e8d85660d0f035b713396510c09c7a05918882336c6179')
sha256sums_aarch64=('71557c262e8ee7e545499e8a8eaaeff6ce2cc00abbfeab4b0bbf04f446a010ed')

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
