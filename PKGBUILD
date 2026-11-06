# Maintainer: Kuro <kurojs@github>

pkgname=routine-notify-bin
_pkgname=routine-notify
pkgver=2.1.0
pkgrel=2
pkgdesc="Daily routine notification manager with scheduled reminders, AI messages and voice"
arch=('x86_64')
url="https://github.com/kurojs/RoutineNotify"
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
optdepends=('libappindicator-gtk3: system tray icon support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
noextract=("${_pkgname}_${pkgver}_amd64.deb")
source=("${_pkgname}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/kurojs/RoutineNotify/v${pkgver}/LICENSE")
sha256sums=('3bab3847318f9f352483e08a33f2e06e72961b7dcd2c7739e88bd9bb98310683'
            '0245351174201391368c8b9ab56925b0f66f5042d0e606ab638f2a1247dbd6ed')

package() {
  bsdtar -xOf "${srcdir}/${_pkgname}_${pkgver}_amd64.deb" data.tar.xz \
    | bsdtar -xf - -C "${pkgdir}" --no-same-owner

  # Electron's SUID sandbox helper
  chmod 4755 "${pkgdir}/opt/RoutineNotify/chrome-sandbox"

  # Launcher in PATH
  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/RoutineNotify/routine-notify "${pkgdir}/usr/bin/${_pkgname}"

  # Debian-specific changelog is not needed
  rm -rf "${pkgdir}/usr/share/doc"

  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
