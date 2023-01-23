# Maintainer: Nikos Toutountzoglou <nikos.toutou@gmail.com>
pkgname=balena-etcher-appimage
pkgver=1.14.3
pkgrel=1
pkgdesc="Flash OS images to SD cards & USB drives, safely and easily"
arch=('x86_64')
url="https://www.balena.io/etcher"
license=("Apache License 2.0")
depends=('fuse2')
provides=("balena-etcher-appimage=${pkgver}")
conflicts=('balena-etcher-appimage' 'balena-etcher')
source=(
    "https://github.com/balena-io/etcher/releases/download/v${pkgver}/balenaEtcher-${pkgver}-x64.AppImage"
    'balena-etcher.sh'
    )
sha256sums=('bae19a72daf569683deb3bee634df74ca46bb08b9118e767adc55e8aa1588818'
            'ff83e497ce3e030d6181ed07e4c25bed90a9c5a959e66b2613ba7ec1f7537cd8')
options=(!strip) # necessary otherwise the AppImage file in the package is truncated
_image="$(basename "${source[0]}")"

prepare() {
  cd "${srcdir}"
  chmod +x "${_image}"
  ./"${_image}" --appimage-extract
  sed -i 's/Exec=.*/Exec=\/usr\/bin\/balena-etcher %U/' "${srcdir}/squashfs-root/balena-etcher.desktop"
}

package() {
  install -Dm755 "${srcdir}/${_image}" "${pkgdir}/opt/balena-etcher/balena-etcher.AppImage"
  install -Dm755 "${srcdir}/balena-etcher.sh" "${pkgdir}/usr/bin/balena-etcher"
  install -dm755 "${pkgdir}/usr/share/"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
  install -Dm644 "${srcdir}/squashfs-root/balena-etcher.desktop" "${pkgdir}/usr/share/applications/balena-etcher.desktop"
}
