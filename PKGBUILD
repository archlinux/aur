#  Maintainer: John Machado <john at delinuxco dot com>

_pkgname=kdenlive
pkgname=kdenlive-appimage
pkgver=24.02.2
pkgrel=0
pkgdesc="A non-linear video editor for Linux using the MLT video framework"
arch=('x86_64')
#url="https://www.kdenlive.org"
license=('GPL')
provides=('kdenlive')
conflicts=('kdenlive')
depends=('breeze' 'breeze-icons')
makedepends=('breeze' 'breeze-icons')
_filename="${_pkgname}-${pkgver}-${arch}.AppImage"
source=("${_filename}::https://download.kde.org/stable/kdenlive/24.02/linux/${_pkgname}-${pkgver}-x86_64.AppImage")
md5sums=('3e5d85c1a194034a0170e75019081a10')
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
  _sizes=('256x256' '128x128' '64x64' '48x48' '32x32' '22x22' '16x16')
  for _size in ${_sizes[@]}; do
  install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_size}/apps/kdenlive.png" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/kdenlive.png"
  done
  install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/org.kde.kdenlive.desktop" "${pkgdir}/usr/share/applications/org.kde.kdenlive.desktop"
  
  #Append Window Class to prevent duplicate launcher icons, since at least version 22.04, StartUpClass entry is included in the desktop file. Removing entry for now.
  #echo "StartupWMClass=kdenlive" >> "${pkgdir}/usr/share/applications/org.kde.kdenlive.desktop"
}
