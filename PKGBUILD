# Maintainer: Joe Sedutto <joe@millyardlabs.com>

pkgname=jlcone-bin
pkgver=1.0.69
pkgrel=1
pkgdesc="JLCPCB desktop client for PCB, PCBA, stencil, and CNC orders"
arch=('x86_64')
url="https://jlcone.com"
license=('LicenseRef-proprietary')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'libcups'
  'gtk3'
  'libdrm'
  'libnotify'
  'libsecret'
  'libxss'
  'libxtst'
  'mesa'
  'nss'
  'xdg-utils'
)
optdepends=(
  'libappindicator-gtk3: tray icon support'
)
provides=('jlcone')
conflicts=('jlcone')
options=('!strip' '!debug')
# Upstream CDN rejected curl's default User-Agent
DLAGENTS=('https::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 -A "Mozilla/5.0" -o %o %u')
source=("https://rs.jlcone.com/static/APP/app_version/jlcone-${pkgver}.deb")
sha256sums=('01c5778da3ead64bfb3058895ed13168b910d51755b18e645d5f3898edc4575a')
noextract=("jlcone-${pkgver}.deb")

package() {
  bsdtar -xOf "jlcone-${pkgver}.deb" data.tar.xz \
    | bsdtar -x -C "${pkgdir}" --exclude './usr/share/doc'

  # Upstream shipped some files world-writable
  chmod -R u+rwX,go+rX,go-w "${pkgdir}"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/JLCONE/jlcone "${pkgdir}/usr/bin/jlcone"

  install -Dm644 "${pkgdir}/opt/JLCONE/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  install -Dm644 "${pkgdir}/opt/JLCONE/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
