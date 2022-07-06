# Maintainer: Gilbert Gilb's <gilbsgilbert@gmail.com>

pkgname=freecad-assembly3-appimage
pkgver=2022.07.04
pkgrel=1
pkgdesc="Assembly3 workbench for FreeCAD."
arch=('x86_64')
url="https://github.com/realthunder/FreeCAD"
license=('LGPLv2')
depends=('fuse2')
options=(!strip) # necessary otherwise the AppImage file in the package is truncated

_filename="FreeCAD-asm3-${pkgver}.AppImage"
_squashfs_desktop_file="freecad_link.desktop"
_desktop_file="/usr/share/applications/freecad-asm3-appimage.desktop"
_appimage_name="FreeCAD-asm3.AppImage"
_install_path="/opt/appimages/${_appimage_name}"

noextract=("${_filename}")
source=(
  "${_filename}::https://github.com/realthunder/FreeCAD/releases/download/2022.07.04-edge/FreeCAD-asm3-Stable-Conda-Py3-Qt5-20220704-glibc2.12-x86_64.AppImage"
  "https://raw.githubusercontent.com/realthunder/FreeCAD/2022.07.04-edge/LICENSE"
  "freecad_link.desktop.patch"
  "appimagetool::https://github.com/AppImage/AppImageKit/releases/download/13/appimagetool-x86_64.AppImage"
)
sha512sums=(
  "144fb04578d7b03f06e70566b7bf822e1fde92c328ba043614ef29c94f606cf25f5f279ca28c10fcf16fbc620636a395caef0bcb34338782dd3e710117746182"
  "4d1b0998dc55adcfb2ac2f33382bce6467078aaa33dbd3bedf5c2102da853d4186836ad4103ea6100f34068751a5a9d627c022bf2f01deb712e88c6c58e0e292"
  "896da9505f97304cdb90a1ce0cdf31770ea5a1264963d72727cd63c68e9927ae4f547ed73cf9eebab1a8427537861f3f43e6d029c3e1460b01c190db02976cac"
  "9225a5df355c4520c5430fc1946f60322c99de36f3446aa17ee8f14af68665bb5b1d2b918079606448e821d93c1dca5b5fbad9ff4ea3f33963181ad2f97b5d67"
)

prepare() {
  cd "${srcdir}"

  chmod +x "${_filename}"

  # Extract relevant files in AppImage
  "./${_filename}" --appimage-extract "usr/share/icons" > /dev/null
  "./${_filename}" --appimage-extract "${_squashfs_desktop_file}" > /dev/null

  # Patch the .desktop file
  patch -Np0 < ./freecad_link.desktop.patch

  # Rename icons
  find "squashfs-root/usr/share/icons" -type f -not -name 'freecad_link.*' -delete
  find "squashfs-root/usr/share/icons" -type d -empty -delete
  find "squashfs-root/usr/share/icons" -type f -name "freecad_link.svg" -execdir mv {} "${pkgname}.svg" \;
  find "squashfs-root/usr/share/icons" -type f -name "freecad_link.png" -execdir mv {} "${pkgname}.png" \;
}

package() {
  # Copy AppImage file
  install -Dm755 "${_filename}" "${pkgdir}/${_install_path}"

  # Make AppImage available as freecad-asm3 in PATH
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "${_install_path}" "${pkgdir}/usr/bin/freecad-asm3"

  # Copy Desktop entry
  install -Dm644 "${srcdir}/squashfs-root/freecad_link.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Copy icons
  install -dm755 "${pkgdir}/usr/share/icons"
  cp -dpr --no-preserve=ownership "squashfs-root/usr/share/icons" "${pkgdir}/usr/share"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

  # Copy license file
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}