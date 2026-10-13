# Maintainer: David Birks <david@birks.dev>

pkgname=arduino-app-lab-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="Visual development environment for Arduino UNO Q and VENTUNO Q boards"
arch=('x86_64')
url="https://github.com/arduino/arduino-app-lab"
license=('GPL-3.0-only')
# Mirroring the Depends line of upstream's .deb metadata:
# https://github.com/arduino/arduino-app-lab/blob/al-0.10.0/standalone-apps/app-lab-desktop/build/debian/arduino-app-lab/DEBIAN/control
depends=(
  'gtk3'
  'webkit2gtk-4.1'
  'noto-fonts-emoji'
  'xdg-utils'
)
optdepends=(
  'arduino-flasher-cli: to flash Linux images onto the board from the CLI'
)
provides=('arduino-app-lab')
conflicts=('arduino-app-lab')
options=('!strip' '!debug')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://downloads.arduino.cc/AppLab/Stable/ArduinoAppLab_${pkgver}_Linux_x86-64.tar.gz"
  "arduino-app-lab.png::https://raw.githubusercontent.com/arduino/arduino-app-lab/al-${pkgver}/standalone-apps/app-lab-desktop/build/debian/arduino-app-lab/usr/share/pixmaps/arduino-app-lab.png"
  'ArduinoAppLab.desktop'
  '99-arduino-app-lab.rules'
)
b2sums=('57520a91863c1ec7c68fe18ced9d4dae938c9374267857caf8f9f2f87109e78809d89182d54f7fbd8ec6b85992c71fc84de251bf08ae2d314beb2e514db6975e'
        'b6e3f7117da10f9660ef71344c6102b0a462edcae0333f83e8ad6dcc0fc19bc3cd21c2a787ee7b46e170aa93e3ed850b509fe2a535012b08cb697897c3719a89'
        'SKIP'
        'SKIP')

package() {
  local _src="${srcdir}/ArduinoAppLab_${pkgver}_Linux_x86-64"

  # Install the binary to /opt and symlink it into /usr/bin
  install -Dm755 "${_src}/arduino-app-lab" "${pkgdir}/opt/arduino-app-lab/arduino-app-lab"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/arduino-app-lab/arduino-app-lab "${pkgdir}/usr/bin/arduino-app-lab"

  # Install desktop file and icon
  install -Dm644 "${srcdir}/ArduinoAppLab.desktop" \
    "${pkgdir}/usr/share/applications/ArduinoAppLab.desktop"
  install -Dm644 "${srcdir}/arduino-app-lab.png" \
    "${pkgdir}/usr/share/pixmaps/arduino-app-lab.png"

  # Install udev rules for the board
  install -Dm644 "${srcdir}/99-arduino-app-lab.rules" \
    "${pkgdir}/usr/lib/udev/rules.d/99-arduino-app-lab.rules"

  # Install third-party notices shipped in the archive
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  cp -a "${_src}/licenses/." "${pkgdir}/usr/share/licenses/${pkgname}/"
}
