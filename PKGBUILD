#  Maintainer: John Machado <john at delinuxco dot com>

_pkgname=Frappe-Books
pkgname=frappebooks-appimage
pkgver=0.36.0
pkgrel=1
pkgdesc="Frappe Books is a simple, well-designed, desktop accounting software for freelancers and small businesses ."
arch=('x86_64')
url="https://frappe.io/"
license=('CC-BY-SA 3.0')
provides=('frappe-books')
conflicts=('frappe-books' 'frappe-books-appimage')
depends=('fuse-common')
_filename="${_pkgname}-${pkgver}-${arch}.AppImage"
source_x86_64=("${_filename}::https://github.com/frappe/books/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${arch}.AppImage")
# https://github.com/frappe/books/releases/download/v0.36.0/Frappe-Books-v0.36.0-linux-x86_64.AppImage
sha256sums_x86_64=('c079d60b9811b6a2f6f329efe5ba14796c4f4ec6f693efdca39b6376fee79602')
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
  install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/${_pkgname}.AppImage"


  # Install global Desktop-Integration
  _sizes=('256x256' '128x128' '64x64' '48x48' '32x32' '16x16')
  for _size in ${_sizes[@]}; do
  install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_size}/apps/frappe-books.png" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/frappe-books.png"

  #Modify and integrate desktop shortcut
  install -Dm644 "${srcdir}/squashfs-root/frappe-books.desktop" "${pkgdir}/usr/share/applications/frappe-books.desktop"  
  sed -i -E 's|Exec=AppRun --no-sandbox %U|Exec=/opt/appimages/Frappe-Books.AppImage %U|g' "${pkgdir}/usr/share/applications/frappe-books.desktop"


done
}
