#  Maintainer: John Machado <john at delinuxco dot com>

_pkgname=Frappe-Books
pkgname=frappebooks-appimage
pkgver=0.21.2
pkgrel=0
pkgdesc="Frappe Books is a simple, well-designed, desktop accounting software for freelancers and small businesses ."
arch=('x86_64')
url="https://frappe.io/"
license=('CC-BY-SA 3.0')
provides=('frappe-books')
conflicts=('frappe-books' 'frappe-books-appimage')
depends=('fuse-common')
_filename="${_pkgname}-${pkgver}-${arch}.AppImage"
source=("${_filename}::https://github.com/frappe/books/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage")
sha256sums=('bd0ee74662c9631c4c20d424ce9a60c2767342094b0f0c4b87f5a84308326cb8')
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
