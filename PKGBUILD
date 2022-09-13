# Submitter: Grey Christoforo <first name [at] last name [dot] net>
# Maintainer: Jeancarlo Hidalgo <jeancahu@gmail.com>

pkgname=albion-online-launcher-bin
pkgver=1.20.050.229341
pkgrel=1
pkgdesc="The first true cross-platform Sandbox MMO -- launcher client"
url="https://albiononline.com/"
arch=('x86_64')
license=('custom')
makedepends=()
depends=(
  'libgl'
  'alsa-lib'
  'libxrandr'
  'qt5-base'
  'qt5-declarative'
  'qt5-location'
  'qt5-webchannel'
  'qt5-webengine'
  'xdelta3'
  'ttf-font'
  'zenity'
)
optdepends=()
source=("https://live.albiononline.com/clients/20220825102752/albion-online-setup"
	"albion-online-launcher.desktop" "albion-online" "Albion-Online.patch")
install=albion-online-launcher-bin.install
options=(!strip docs libtool emptydirs !zipman staticlibs)
sha256sums=('89f4b80b77984cc304b4af6a6b8bdea95dcf3395521cda160ed22c947c19e006'
  'SKIP' 'SKIP' 'SKIP')

prepare() {
  pushd "${srcdir}/data/launcher"
  rm libQt5* qt.conf xdelta3 QtWebEngineProcess libicu*
  popd

  pushd "${srcdir}/data"
  patch Albion-Online < "${srcdir}/Albion-Online.patch"
  popd
}

package() {
  mkdir -p "${pkgdir}/opt"
  cp -a "${srcdir}/data" "${pkgdir}/opt/${pkgname}"
  chmod 755 "$pkgdir/opt/${pkgname}"

  mkdir -p "${pkgdir}/opt/${pkgname}/game_x64"
  chmod 2775 "${pkgdir}/opt/${pkgname}/game_x64"

  # Link launcher to usr/system binaries directory
  mkdir -p "${pkgdir}/usr/bin"
  install -m755 -D "${srcdir}/albion-online" "${pkgdir}/usr/bin"

  # Install .desktop file
  install -m755 -D "${srcdir}/albion-online-launcher.desktop" -t "${pkgdir}/usr/share/applications"

  # Move EULA to /usr/share licenses path
  install -Dm644 "${srcdir}/data/eula.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
