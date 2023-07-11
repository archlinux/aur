#  Maintainer: John Machado <john at delinuxco dot com>

_pkgname=OpenRGB
pkgname=openrgb-appimage
pkgver=0.9
pkgrel=0
pkgdesc="Open source RGB lighting control that doesn't depend on manufacturer software."
arch=('x86_64')
#url="https://openrgb.org"
license=('GPL')
provides=('openrgb')
conflicts=('openrgb' 'openrgb-bin' 'openrgb-git')
depends=()
makedepends=()
_filename="${_pkgname}-${pkgver}-${arch}.AppImage"
source=("${_filename}::https://openrgb.org/releases/release_0.9/${_pkgname}_${pkgver}_${arch}_b5f46e3.AppImage")
md5sums=('8682f8810c029f45b62c3938bcaf44ee')
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

  install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/128x128/apps/OpenRGB.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/OpenRGB.png"
  install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/OpenRGB.desktop" "${pkgdir}/usr/share/applications/OpenRGB.desktop"
  
}
