# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=opencode-desktop-bin
pkgver=1.1.24
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
sha256sums_x86_64=('8bc26ca3bd89bf9a10bb4a6ff7bbeec25e21677366ef47b01b230319c8284d57')
sha256sums_aarch64=('98629442128828bd1850b5a15624b230a88b40a8895ef8edca90207cfde613ae')

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
