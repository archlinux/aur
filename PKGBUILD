#  Maintainer: Radim Vančo (FoxKyong) <radim.vanco@jifox.cz>
#  Contributor: Alper Şal <alper@sal.web.tr>

_pkgname=nperf-gui
pkgname=nperf-gui-appimage
pkgver=2.15.11
pkgrel=1
pkgdesc="Nperf wide-area network speed test application."
arch=('x86_64')
url="https://www.nperf.com/"
license=('LicenseRef-nPerf')
depends=('fuse')
provides=('nperf-gui')
_filename="nPerf-${pkgver}-${arch}.AppImage"
source=("https://repo.nperf.com/linux/nperf/nPerf-${pkgver}-${arch}.AppImage")
sha256sums=('13e422321043f1350384c566f8dfca75ca93fd3ee84b471cf3030eed53402d87')
options=('!strip' '!debug')
prepare() 
{
  cd "${srcdir}"
  chmod +x ${_filename}
  eval ./${_filename} --appimage-extract "*/*/*/*/*x*/apps/*.png"
  eval ./${_filename} --appimage-extract "*/*/applications/*.desktop"
}

package() 
{
  # Install AppImage
  install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/${_filename}"

  # Install Exec Script
  ExecScript="#!/bin/sh\nexec /opt/appimages/${_filename} \"\$@\""
  install -dm755 "${pkgdir}/usr/bin"
  echo -e $ExecScript > "${pkgdir}/usr/bin/${_pkgname}"
  chmod 755 "${pkgdir}/usr/bin/${_pkgname}"

  # Install global Desktop-Integration
#   _sizes=('256x256' '128x128' '64x64' '48x48' '32x32' '22x22' '16x16')
#   for _size in ${_sizes[@]}; do
#   install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_size}/apps/nPerf.png" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/nPerf.png"
#   done
  install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/com.nperf.tester.desktop" "${pkgdir}/usr/share/applications/com.nperf.tester.desktop"
}