#  Maintainer: John Machado <john at delinuxco dot com>

_pkgname=Frappe-Books
pkgname=frappebooks-appimage
pkgver=0.14.1
pkgrel=1
pkgdesc="Frappe Books is a simple, well-designed, desktop accounting software for freelancers and small businesses ."
arch=('x86_64')
#url="https://frappebooks.com/"
license=('CC-BY-SA 3.0')
provides=('frappe-books')
conflicts=('frappe-books')
depends=('fuse-common')
_filename="${_pkgname}-${pkgver}-${arch}.AppImage"
source=("${_filename}::https://github.com/frappe/books/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage")
md5sums=('32b800cddc16ffd9b585b75ff057b2ff')
options=(!strip)
prepare() 
{
  cd "${srcdir}"
  chmod +x ${_filename}
  eval ./${_filename} --appimage-extract "*/*/*/*/*x*/apps/*.png"
  eval ./${_filename} --appimage-extract "*.desktop"
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
  _sizes=('256x256' '128x128' '64x64' '48x48' '32x32' '16x16')
  for _size in ${_sizes[@]}; do
  install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_size}/apps/frappe-books.png" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/frappe-books.png"

  #Modify and integrate desktop shortcut
  install -Dm644 "${srcdir}/squashfs-root/frappe-books.desktop" "${pkgdir}/usr/share/applications/frappe-books.desktop"  
  sed -i 's/Exec=AppRun --no-sandbox %U/Exec=Frappe-Books %U/g' "${pkgdir}/usr/share/applications/frappe-books.desktop"

done
}
