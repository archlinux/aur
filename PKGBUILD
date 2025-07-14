# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=uhk-agent-appimage
pkgver=8.0.0
pkgrel=1
pkgdesc="The configuration application of the Ultimate Hacking Keyboard."
arch=('x86_64')
url="https://github.com/UltimateHackingKeyboard/agent"
license=('GPL3')
depends=(libusb fuse2 dbus-glib gtk2)
source=("https://github.com/UltimateHackingKeyboard/agent/releases/download/v${pkgver}/UHK.Agent-${pkgver}-linux-x86_64.AppImage"
        uhk-agent.desktop.patch
        uhk-agent.sh)
sha256sums=('d578261808cba3127d67279a0d293c502f5f555c2463cde2f83441448433eff3'
            '4c4b3b0a8c6313355c0afdd9a8a9509fd00f6e53ec44d623fd35adce598fd400'
            'a82c8fdf2dcdfdd0a7cc92552451007fb6dd2abe8e7720126add3ee0b8156423')
options=(!strip !debug)
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
