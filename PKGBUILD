# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=opencode-desktop-bin
pkgver=1.1.46
pkgrel=1
pkgdesc="OpenCode desktop client"
arch=('x86_64' 'aarch64')
url="https://opencode.ai"
license=('MIT')
provides=('opencode-desktop')
conflicts=('opencode-desktop')
depends=('gtk3' 'webkit2gtk-4.1' 'hicolor-icon-theme' 'gst-plugins-good')
options=('!strip' '!debug')

latestver() {
  curl -fsSL "https://api.github.com/repos/anomalyco/opencode/releases/latest" |
    jq -r '.tag_name // empty' | sed 's/^v//'
}

source=("LICENSE::https://raw.githubusercontent.com/anomalyco/opencode/v${pkgver}/LICENSE")
source_x86_64=("opencode-desktop-${pkgver}-linux-amd64.deb::https://github.com/anomalyco/opencode/releases/download/v${pkgver}/opencode-desktop-linux-amd64.deb")
source_aarch64=("opencode-desktop-${pkgver}-linux-arm64.deb::https://github.com/anomalyco/opencode/releases/download/v${pkgver}/opencode-desktop-linux-arm64.deb")
sha256sums=('625f0f619133f89bbbb2abe37369613dfa1885eba1e50d02170deb62bb42cb6b')
sha256sums_x86_64=('0d866f1aa91481bb3d0318365f1d40f0fd0c1e752eae6e3cd6339b7ce6c2afe2')
sha256sums_aarch64=('c6ed932ba434768a3f7490f67c64c6f189bc1d2fe2724f04f03e2f5d3333b617')

package() {
  local debfile
  case "$CARCH" in
    x86_64) debfile="opencode-desktop-${pkgver}-linux-amd64.deb" ;;
    aarch64) debfile="opencode-desktop-${pkgver}-linux-arm64.deb" ;;
  esac

  bsdtar -xf "${srcdir}/${debfile}" -C "${srcdir}" data.tar.gz control.tar.gz
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
