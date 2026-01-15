# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=opencode-desktop-bin
pkgver=1.1.21
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

case "$CARCH" in
  x86_64)   _debarch="amd64" ;;
  aarch64)  _debarch="arm64" ;;
esac

source=("opencode-desktop-linux-${_debarch}.deb::https://github.com/anomalyco/opencode/releases/download/v${pkgver}/opencode-desktop-linux-${_debarch}.deb"
        "LICENSE::https://raw.githubusercontent.com/anomalyco/opencode/v${pkgver}/LICENSE")
sha256sums=('dcc198ec13bc7feb7fb085f966072e0a6d820a38e2c7af518489d8b7db040b9e'
            '625f0f619133f89bbbb2abe37369613dfa1885eba1e50d02170deb62bb42cb6b')

package() {
  bsdtar -xf "${srcdir}/opencode-desktop-linux-${_debarch}.deb" -C "${srcdir}" data.tar.gz control.tar.gz
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
