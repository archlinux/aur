# Maintainer: pinoybear <puchika at gmail dot com>

pkgname=openpets-bin
_pkgname=openpets
pkgver=4.0.0
pkgrel=1
pkgdesc="Local-first desktop companion with animated pets, plugin SDK and coding-agent integrations"
arch=('x86_64')
url="https://openpets.dev"
license=('MIT')
depends=('alsa-lib' 'at-spi2-core' 'gtk3' 'hicolor-icon-theme' 'libnotify' 'libsecret'
         'libx11' 'libxcb' 'libxkbcommon' 'libxss' 'libxtst' 'mesa' 'nss' 'pango'
         'systemd-libs' 'util-linux-libs' 'xdg-utils')
optdepends=('nodejs: coding-agent integrations (MCP server and hooks)'
            'gnome-shell-extension-appindicator: tray icon on GNOME')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
source=("https://github.com/alvinunreal/openpets/releases/download/v${pkgver}/OpenPets-${pkgver}-linux-amd64.deb"
        "LICENSE-${pkgver}::https://github.com/alvinunreal/openpets/raw/v${pkgver}/LICENSE")
sha256sums=('af2ae8b4bd030cf5140b580067486eafa1976d7ddedfb21748fbb3e3cbcc3d2c'
            'ff1965c8f5bdebfb28f63b208ee8e0fa381ae5e9be4146e12206bf3eeeeb72ed')

package() {
  bsdtar -xf data.tar.xz -C "${pkgdir}" --exclude='./usr/share/doc'

  # Same launcher link the upstream .deb creates
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/OpenPets/openpets "${pkgdir}/usr/bin/${_pkgname}"

  # Arch has unprivileged user namespaces, so no setuid sandbox (matches upstream postinst)
  chmod 0755 "${pkgdir}/opt/OpenPets/chrome-sandbox"

  # Stray VCS metadata shipped inside a bundled plugin
  rm -rf "${pkgdir}/opt/OpenPets/resources/plugins/official/openpets.system-resources/.git"

  # Window class is open-pets-desktop, not OpenPets; fixes taskbar/icon grouping
  sed -i 's/^StartupWMClass=OpenPets$/StartupWMClass=open-pets-desktop/' \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
