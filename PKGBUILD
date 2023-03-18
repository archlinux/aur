# Maintainer: detiam <dehe_tian@outlook.com>

pkgname=balena-etcher-electron-bin
pkgver=1.18.4
pkgrel=2
pkgdesc="Flash OS images to SD cards & USB drives, safely and easily (use system electron runtime)"
arch=(x86_64)
url="https://www.balena.io/etcher"
license=("Apache License 2.0")
provides=("balena-etcher-appimage=${pkgver}")
conflicts=('balena-etcher-appimage' 'balena-etcher')
depends=(
  electron
  gconf
  gtk3
  nss
  libxss
  libxtst
  xdg-utils
  at-spi2-core
  util-linux-libs
  libsecret
  alsa-lib
  glib2
  polkit
  libusb
)
optdepends=('libappindicator-gtk3' 'libnotify: for notifications')
makedepends=('fuse2')
options=(!strip)
source=(
    "https://github.com/balena-io/etcher/releases/download/v${pkgver}/balenaEtcher-${pkgver}-x64.AppImage"
    "balena-etcher-electron.sh"
)
sha256sums=('SKIP' 'SKIP')
_image="$(basename "${source[0]}")"

prepare() {
    cd "${srcdir}"
    chmod +x "${_image}"
    ./"${_image}" --appimage-extract
    sed -i 's/Exec=.*/Exec=\/usr\/bin\/balena-etcher-electron %U/' "${srcdir}/squashfs-root/balena-etcher.desktop"
}

package() {
  install -Dm755 "${srcdir}/balena-etcher-electron.sh" "${pkgdir}/usr/bin/balena-etcher-electron"
  install -dm755 "${pkgdir}/usr/lib/"
  install -dm755 "${pkgdir}/usr/share/"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/resources/app" "${pkgdir}/usr/lib/balena-etcher-electron"
  install -Dm644 "${srcdir}/squashfs-root/balena-etcher.desktop" "${pkgdir}/usr/share/applications/balena-etcher.desktop"
}
