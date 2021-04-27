# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=uhk-agent-appimage
pkgver=1.5.12
pkgrel=1
pkgdesc="The configuration application of the Ultimate Hacking Keyboard."
arch=('x86_64')
url="https://github.com/UltimateHackingKeyboard/agent"
license=('GPL3')
depends=(libusb fuse2 dbus-glib gtk2)
source=("https://github.com/UltimateHackingKeyboard/agent/releases/download/v${pkgver}/UHK.Agent-${pkgver}-linux-x86_64.AppImage"
        uhk-agent.desktop.patch
        uhk-agent.sh)
md5sums=('cdaebe7dac2b829878a67a7b6981da28'
         '1224228320a6c7553ee66619fba68c98'
         'a417373306c108ea2632571d8309df9b')
options=(!strip)
install=${pkgname}.install
_filename=./UHK.Agent-${pkgver}-linux-x86_64.AppImage

prepare() {
  cd "${srcdir}"
  chmod +x ${_filename}
  ${_filename} --appimage-extract
  patch -Np0 < ./uhk-agent.desktop.patch
}

package() {
  install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/UHK.Agent.AppImage"
  install -Dm755 "${srcdir}/uhk-agent.sh" "${pkgdir}/usr/bin/uhk-agent"

  install -dm755 "${pkgdir}/usr/share/"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

  install -Dm644 "${srcdir}/squashfs-root/uhk-agent.desktop" "${pkgdir}/usr/share/applications/uhk-agent.desktop"
  install -Dm644 "${srcdir}/squashfs-root/resources/rules/50-uhk60.rules" "${pkgdir}/etc/udev/rules.d/50-uhk60.rules"
}

# vim:set ts=2 sw=2 et:
