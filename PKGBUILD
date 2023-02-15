# Maintainer: Nikos Toutountzoglou <nikos.toutou@gmail.com>
pkgname=balena-etcher-appimage
pkgver=1.14.3
pkgrel=2
pkgdesc="Flash OS images to SD cards & USB drives, safely and easily"
arch=('x86_64')
url="https://www.balena.io/etcher"
license=('Apache')
depends=('fuse2')
provides=("balena-etcher-appimage=${pkgver}")
conflicts=('balena-etcher-appimage' 'balena-etcher')
source=("https://github.com/balena-io/etcher/releases/download/v${pkgver}/balenaEtcher-${pkgver}-x64.AppImage")
sha256sums=('bae19a72daf569683deb3bee634df74ca46bb08b9118e767adc55e8aa1588818')
options=(!strip) # necessary otherwise the AppImage file in the package is truncated
_image="$(basename "${source[0]}")"

prepare() {
  cd "${srcdir}"
  chmod +x "${_image}"
  ./"${_image}" --appimage-extract
  sed -i -e "s/AppRun/\/usr\/bin\/balena-etcher/" "${srcdir}/squashfs-root/balena-etcher.desktop"
  cat > balena-etcher.sh <<EOF
#!/bin/sh
/opt/balena-etcher/balena-etcher.AppImage "\$@"
EOF
}

package() {
  install -Dm755 "${srcdir}/${_image}" "${pkgdir}/opt/balena-etcher/balena-etcher.AppImage"
  install -Dm755 "${srcdir}/balena-etcher.sh" "${pkgdir}/usr/bin/balena-etcher"
  install -dm755 "${pkgdir}/usr/share/"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
  install -Dm644 "${srcdir}/squashfs-root/balena-etcher.desktop" "${pkgdir}/usr/share/applications/balena-etcher.desktop"
}
