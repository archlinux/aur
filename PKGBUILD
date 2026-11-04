# Maintainer: infabo <der_ulmen@yahoo.de>

pkgname=fortifone-bin
pkgver=8.0.0.67
pkgrel=1
pkgdesc='Fortinet softclient for FortiVoice phone systems and FortiVoice Cloud'
arch=('x86_64')
url='https://fortivoice-cloud.com/noauth/index.html'
license=('LicenseRef-Fortinet')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'glib2'
  'glibc'
  'gtk3'
  'libcups'
  'libgcc'
  'libnotify'
  'libpulse'
  'libsecret'
  'libstdc++'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxss'
  'libxtst'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
  'util-linux-libs'
  'xdg-utils'
)
makedepends=('libarchive')
optdepends=(
  'libappindicator: system tray integration'
  'gnome-keyring: Secret Service provider for credential storage'
  'xorg-xwayland: run the upstream X11 desktop launcher in a Wayland session'
)
provides=("fortifone=${pkgver}")
conflicts=('fortifone')
options=('!strip' '!debug')

# Upstream names the release 8.0.0.67, but omits the patch version in the URL.
_debname="FortiFone_linux_v${pkgver%.*.*}_b${pkgver##*.}.deb"
source=(
  "https://fwimage.fortivoice-cloud.com/fortivoicecloud-firmware-prd/${_debname}"
  'https://www.fortinet.com/doc/legal/EULA.pdf'
)
noextract=("${_debname}" 'EULA.pdf')
sha256sums=(
  'e16c571c0173d096b1865aa345564ecb94188901f01486bec52b9ee9fa94960d'
  '6b8d3a60693e6f968a71f2bca5495d4ceff54f37b8c35844bb2a97a822ed533a'
)

prepare() {
  bsdtar -xf "${srcdir}/${_debname}" -C "${srcdir}" data.tar.xz
}

package() {
  # Includes /usr/share/applications/fortifone.desktop and the hicolor icons.
  # Keep upstream's Exec=/opt/FortiFone/fortifone --ozone-platform=x11 %U,
  # including its URL handlers and StartupWMClass, for application menu launches.
  bsdtar --no-same-owner -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/FortiFone/fortifone "${pkgdir}/usr/bin/fortifone"

  # The upstream postinst sets this permission for Electron's sandbox helper.
  chmod 4755 "${pkgdir}/opt/FortiFone/chrome-sandbox"

  install -Dm644 "${srcdir}/EULA.pdf" \
    "${pkgdir}/usr/share/licenses/${pkgname}/EULA.pdf"
  ln -s /opt/FortiFone/LICENSE.electron.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  ln -s /opt/FortiFone/LICENSES.chromium.html \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
