# Maintainer: Zosma AI <info@zosma.ai>
# Contributor: Arjun Nayak <arjun@zosma.ai>

pkgname=zosma-cowork-bin
pkgver=0.8.3
pkgrel=1
pkgdesc="Desktop AI coworker built on the pi coding agent — streaming, thinking, tool calls"
arch=('x86_64')
url="https://github.com/zosmaai/zosma-cowork"
license=('MIT')
depends=('webkit2gtk-4.1' 'libjavascriptcoregtk-4.1' 'gtk3' 'libappindicator-gtk3' 'librsvg')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("zosma-cowork-${pkgver}.deb::${url}/releases/download/v${pkgver}/zosma-cowork_${pkgver}_amd64.deb")
sha256sums=('SKIP')
options=('!strip')

package() {
  bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.deb" -C "${pkgdir}" 2>/dev/null || {
    # If bsdtar fails, extract using ar + tar
    ar x "${srcdir}/${pkgname%-bin}-${pkgver}.deb"
    bsdtar -xf data.tar.* -C "${pkgdir}"
  }

  # Ensure binary is executable
  if [[ -f "${pkgdir}/usr/bin/zosma-cowork" ]]; then
    chmod +x "${pkgdir}/usr/bin/zosma-cowork"
  fi

  # Install desktop file and icon
  install -Dm644 "${pkgdir}/usr/share/applications/"*.desktop -t "${pkgdir}/usr/share/applications/" 2>/dev/null || true
  install -Dm644 "${pkgdir}/usr/share/icons/"* -t "${pkgdir}/usr/share/icons/" 2>/dev/null || true
}
