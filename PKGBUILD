#  Maintainer: Alper Şal <alper@sal.web.tr>

_pkgname=nperf-gui
pkgname=nperf-gui-appimage
pkgver=latest
pkgrel=0
pkgdesc="Nperf wide-area network speed test application."
arch=('x86_64')
#url="https://www.nperf.com/"
license=('GPL')
provides=('nperf-gui')
_filename="nPerf-${pkgver}-${arch}.AppImage"
source=("https://repo.nperf.com/linux/nperf/nPerf-latest-x86_64.AppImage")
md5sums=('e97cfe46df5f7ba3e58df79f7f5a902e')
options=(!strip)
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
  chmod +x "${pkgdir}/usr/bin/${_pkgname}"

  # Install global Desktop-Integration
#   _sizes=('256x256' '128x128' '64x64' '48x48' '32x32' '22x22' '16x16')
#   for _size in ${_sizes[@]}; do
#   install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_size}/apps/nPerf.png" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/nPerf.png"
#   done
  install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/com.nperf.tester.desktop" "${pkgdir}/usr/share/applications/com.nperf.tester.desktop"
}